import "package:assignment/core/constants/image_constants.dart";
import "package:assignment/core/constants/string_constants.dart";
import "package:assignment/core/constants/theme_constants.dart";
import "package:assignment/core/shared/domain/method/methods.dart";
import "package:assignment/core/shared/presentation/widget/action_button.dart";
import "package:flutter/material.dart";
import "package:table_calendar/table_calendar.dart";

class CommonCalendarPicker extends StatefulWidget {
  const CommonCalendarPicker({
    required this.isStartDate,
    this.selectedDate,
    super.key,
  });

  final bool isStartDate;
  final DateTime? selectedDate;

  @override
  State<CommonCalendarPicker> createState() => _CommonCalendarPickerState();
}

class _CommonCalendarPickerState extends State<CommonCalendarPicker> {
  late DateTime _selectedDay;
  late DateTime _focusedDay;
  late DateTime _today;

  @override
  void initState() {
    super.initState();
    _today = DateTime.now();
    _selectedDay = widget.selectedDate ?? DateTime(0);
    _focusedDay = widget.selectedDate ?? _today;
  }

  bool _isToday() =>
      _selectedDay.year == _today.year &&
      _selectedDay.month == _today.month &&
      _selectedDay.day == _today.day;

  DateTime _nextMonday() {
    final DateTime currentDate = _today;
    int daysUntilNextMonday = DateTime.monday - currentDate.weekday;
    if (daysUntilNextMonday <= 0) {
      daysUntilNextMonday += 7;
    }
    return currentDate.add(Duration(days: daysUntilNextMonday));
  }

  DateTime _nextTuesday() {
    final DateTime currentDate = _today;
    int daysUntilNextTuesday = DateTime.tuesday - currentDate.weekday;
    if (daysUntilNextTuesday <= 0) {
      daysUntilNextTuesday += 7;
    }
    return currentDate.add(Duration(days: daysUntilNextTuesday));
  }

  DateTime _afterOneWeek() => _today.add(const Duration(days: 7));

  bool _isSelected(DateTime date) => _selectedDay == date;

  @override
  Widget build(BuildContext context) => Dialog(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    insetPadding: const EdgeInsets.symmetric(horizontal: 16),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            spacing: 8,
            children: <Widget>[
              if (widget.isStartDate) ...<Widget>[
                Row(
                  spacing: 16,
                  children: <Widget>[
                    Expanded(
                      child: ActionButton(
                        onPressed: () {
                          setState(() {
                            _selectedDay = _today;
                            _focusedDay = _today;
                          });
                        },
                        title: StringConstants.strToday,
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        backgroundColor:
                            _isToday()
                                ? ThemeColors.clrPrimary
                                : ThemeColors.clrSecondary,
                        textColor:
                            _isToday()
                                ? ThemeColors.clrWhite
                                : ThemeColors.clrPrimary,
                      ),
                    ),
                    Expanded(
                      child: ActionButton(
                        onPressed: () {
                          setState(() {
                            _selectedDay = _nextMonday();
                            _focusedDay = _nextMonday();
                          });
                        },
                        title: StringConstants.strNextMonday,
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        backgroundColor:
                            _isSelected(_nextMonday())
                                ? ThemeColors.clrPrimary
                                : ThemeColors.clrSecondary,
                        textColor:
                            _isSelected(_nextMonday())
                                ? ThemeColors.clrWhite
                                : ThemeColors.clrPrimary,
                      ),
                    ),
                  ],
                ),
                Row(
                  spacing: 16,
                  children: <Widget>[
                    Expanded(
                      child: ActionButton(
                        onPressed: () {
                          setState(() {
                            _selectedDay = _nextTuesday();
                            _focusedDay = _nextTuesday();
                          });
                        },
                        title: StringConstants.strNextTuesday,
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        backgroundColor:
                            _isSelected(_nextTuesday())
                                ? ThemeColors.clrPrimary
                                : ThemeColors.clrSecondary,
                        textColor:
                            _isSelected(_nextTuesday())
                                ? ThemeColors.clrWhite
                                : ThemeColors.clrPrimary,
                      ),
                    ),
                    Expanded(
                      child: ActionButton(
                        onPressed: () {
                          setState(() {
                            _selectedDay = _afterOneWeek();
                            _focusedDay = _afterOneWeek();
                          });
                        },
                        title: StringConstants.strAfterWeek,
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        backgroundColor:
                            _isSelected(_afterOneWeek())
                                ? ThemeColors.clrPrimary
                                : ThemeColors.clrSecondary,
                        textColor:
                            _isSelected(_afterOneWeek())
                                ? ThemeColors.clrWhite
                                : ThemeColors.clrPrimary,
                      ),
                    ),
                  ],
                ),
              ] else
                Row(
                  spacing: 16,
                  children: <Widget>[
                    Expanded(
                      child: ActionButton(
                        onPressed: () {
                          setState(() {
                            _selectedDay = DateTime(0);
                            _focusedDay = _today;
                          });
                        },
                        title: StringConstants.strNoDate,
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        backgroundColor:
                            _isSelected(DateTime(0))
                                ? ThemeColors.clrPrimary
                                : ThemeColors.clrSecondary,
                        textColor:
                            _isSelected(DateTime(0))
                                ? ThemeColors.clrWhite
                                : ThemeColors.clrPrimary,
                      ),
                    ),
                    Expanded(
                      child: ActionButton(
                        onPressed: () {
                          setState(() {
                            _selectedDay = _today;
                            _focusedDay = _today;
                          });
                        },
                        title: StringConstants.strToday,
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        backgroundColor:
                            _isToday()
                                ? ThemeColors.clrPrimary
                                : ThemeColors.clrSecondary,
                        textColor:
                            _isToday()
                                ? ThemeColors.clrWhite
                                : ThemeColors.clrPrimary,
                      ),
                    ),
                  ],
                ),

              TableCalendar<dynamic>(
                firstDay: DateTime.utc(2020),
                lastDay: DateTime.utc(2030, 12, 31),
                focusedDay: _focusedDay,
                selectedDayPredicate:
                    (DateTime day) => isSameDay(_selectedDay, day),
                onDaySelected: (DateTime selectedDay, DateTime focusedDay) {
                  setState(() {
                    _selectedDay = selectedDay;
                    _focusedDay = focusedDay;
                  });
                },
                onPageChanged: (DateTime focusedDay) {
                  _focusedDay = focusedDay;
                },
                headerStyle: const HeaderStyle(
                  formatButtonVisible: false,
                  titleCentered: true,
                  titleTextStyle: TextStyle(
                    fontSize: FontSize.fontSizeLarge,
                    fontWeight: FontWeight.w500,
                    color: ThemeColors.clrBlack50,
                  ),
                ),
                daysOfWeekStyle: const DaysOfWeekStyle(
                  weekdayStyle: TextStyle(color: ThemeColors.clrBlack50),
                  weekendStyle: TextStyle(color: ThemeColors.clrBlack50),
                ),
                calendarStyle: CalendarStyle(
                  cellMargin: const EdgeInsets.all(10),
                  defaultTextStyle: const TextStyle(
                    fontSize: FontSize.fontSize15,
                    color: ThemeColors.clrBlack50,
                  ),
                  disabledTextStyle: const TextStyle(
                    color: ThemeColors.clrWhite100,
                    fontSize: FontSize.fontSize15,
                  ),
                  todayDecoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: ThemeColors.clrPrimary),
                  ),
                  selectedDecoration: const BoxDecoration(
                    color: ThemeColors.clrPrimary,
                    shape: BoxShape.circle,
                  ),
                  selectedTextStyle: const TextStyle(
                    color: ThemeColors.clrWhite,
                    fontSize: FontSize.fontSize15,
                  ),
                  todayTextStyle: const TextStyle(
                    color: ThemeColors.clrPrimary,
                    fontSize: FontSize.fontSize15,
                  ),
                  weekendTextStyle: const TextStyle(
                    color: ThemeColors.clrBlack50,
                    fontSize: FontSize.fontSize15,
                  ),
                ),
              ),
            ],
          ),
        ),
        const Divider(color: ThemeColors.clrWhite50, height: 0),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                child: Row(
                  spacing: 12,
                  children: <Widget>[
                    const ImageIcon(
                      AssetImage(IconConstants.icCalendar),
                      size: 25,
                      color: ThemeColors.clrPrimary,
                    ),
                    Flexible(
                      child: Text(
                        _selectedDay == DateTime(0)
                            ? StringConstants.strNoDate
                            : formatToDateMonthYear.format(_selectedDay),
                        style: const TextStyle(
                          fontSize: FontSize.fontSizeMedium,
                          color: ThemeColors.clrBlack50,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                spacing: 20,
                children: <Widget>[
                  ActionButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    title: StringConstants.strCancel,
                    backgroundColor: ThemeColors.clrSecondary,
                    textColor: ThemeColors.clrPrimary,
                  ),
                  ActionButton(
                    onPressed: () {
                      Navigator.pop(context);
                      // showSnackBar(
                      //   context,
                      //   title: "selected-date-$_selectedDay",
                      // );
                    },
                    title: StringConstants.strSave,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
