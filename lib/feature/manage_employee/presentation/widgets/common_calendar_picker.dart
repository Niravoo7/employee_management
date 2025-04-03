import "package:assignment/core/constants/image_constants.dart";
import "package:assignment/core/constants/string_constants.dart";
import "package:assignment/core/constants/theme_constants.dart";
import "package:assignment/core/shared/domain/method/methods.dart";
import "package:assignment/core/shared/presentation/widget/action_button.dart";
import "package:assignment/core/utils/date_utils.dart";
import "package:flutter/material.dart";
import "package:table_calendar/table_calendar.dart";

enum DatePickerItem { noDate, today, nextMonday, nextTuesday, after1Week }

class CommonCalendarPicker extends StatefulWidget {
  const CommonCalendarPicker({
    required this.isStartDate,
    required this.selectedDate,
    required this.onDateSelected,
    super.key,
  });

  final bool isStartDate;
  final DateTime? selectedDate;
  final Function(DateTime) onDateSelected;

  @override
  State<CommonCalendarPicker> createState() => _CommonCalendarPickerState();
}

class _CommonCalendarPickerState extends State<CommonCalendarPicker> {
  late DateTime _selectedDate;
  late DatePickerItem selectedDatePickerItem = DatePickerItem.today;
  late List<DatePickerItem> dateOptions = <DatePickerItem>[];

  @override
  void initState() {
    super.initState();
    if (widget.isStartDate) {
      selectedDatePickerItem = DatePickerItem.today;
      dateOptions = <DatePickerItem>[
        DatePickerItem.today,
        DatePickerItem.nextMonday,
        DatePickerItem.nextTuesday,
        DatePickerItem.after1Week,
      ];
    } else {
      selectedDatePickerItem = DatePickerItem.noDate;
      dateOptions = <DatePickerItem>[
        DatePickerItem.noDate,
        DatePickerItem.today,
      ];
    }
    _selectedDate = widget.selectedDate ?? DateTime.now();
  }

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
              GridView.builder(
                shrinkWrap: true,
                padding: const EdgeInsets.all(15),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                  childAspectRatio: 4,
                ),
                itemCount: dateOptions.length,
                itemBuilder:
                    (BuildContext context, int index) => Expanded(
                      child: ActionButton(
                        onPressed: () {
                          setState(() {
                            selectedDatePickerItem = dateOptions[index];
                            switch (dateOptions[index]) {
                              case DatePickerItem.noDate:
                                _selectedDate = DateTime(0);
                                break;
                              case DatePickerItem.today:
                                _selectedDate = DateTime.now();
                                break;
                              case DatePickerItem.nextMonday:
                                _selectedDate = nextMonday();
                                break;
                              case DatePickerItem.nextTuesday:
                                _selectedDate = nextTuesday();
                                break;
                              case DatePickerItem.after1Week:
                                _selectedDate = afterOneWeek();
                                break;
                            }
                          });
                        },
                        title: getDatePickerItemString(dateOptions[index]),
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        backgroundColor:
                            selectedDatePickerItem == dateOptions[index]
                                ? ThemeColors.clrPrimary
                                : ThemeColors.clrSecondary,
                        textColor:
                            selectedDatePickerItem == dateOptions[index]
                                ? ThemeColors.clrWhite
                                : ThemeColors.clrPrimary,
                      ),
                    ),
              ),
              TableCalendar<dynamic>(
                firstDay: DateTime.utc(2020),
                lastDay: DateTime.utc(2030, 12, 31),
                focusedDay: DateTime.now(),
                selectedDayPredicate:
                    (DateTime day) => isSameDay(
                      selectedDatePickerItem == DatePickerItem.noDate
                          ? DateTime(0)
                          : _selectedDate,
                      day,
                    ),
                onDaySelected: (DateTime selectedDay, DateTime focusedDay) {
                  setState(() {
                    _selectedDate = selectedDay;
                  });
                },
                onPageChanged: (DateTime focusedDay) {},
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
                        _selectedDate == DateTime(0)
                            ? StringConstants.strNoDate
                            : formatToDateMonthYear.format(_selectedDate),
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
