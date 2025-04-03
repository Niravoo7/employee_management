import "package:assignment/core/constants/image_constants.dart";
import "package:assignment/core/constants/string_constants.dart";
import "package:assignment/core/constants/theme_constants.dart";
import "package:assignment/core/shared/presentation/widget/action_button.dart";
import "package:flutter/material.dart";
import "package:table_calendar/table_calendar.dart";

class CommonCalendarPicker extends StatelessWidget {
  const CommonCalendarPicker({super.key});

  @override
  Widget build(BuildContext context) => Dialog(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    insetPadding: const EdgeInsets.symmetric(horizontal: 16),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            spacing: 8,
            children: <Widget>[
              Row(
                spacing: 16,
                children: <Widget>[
                  Expanded(
                    child: ActionButton(
                      onPressed: () {},
                      title: StringConstants.strToday,
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      backgroundColor: ThemeColors.clrSecondary,
                      textColor: ThemeColors.clrPrimary,
                    ),
                  ),
                  Expanded(
                    child: ActionButton(
                      onPressed: () {},
                      title: StringConstants.strNextMonday,
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      backgroundColor: ThemeColors.clrSecondary,
                      textColor: ThemeColors.clrPrimary,
                    ),
                  ),
                ],
              ),
              Row(
                spacing: 16,
                children: <Widget>[
                  Expanded(
                    child: ActionButton(
                      onPressed: () {},
                      title: StringConstants.strNextTuesday,
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      backgroundColor: ThemeColors.clrSecondary,
                      textColor: ThemeColors.clrPrimary,
                    ),
                  ),
                  Expanded(
                    child: ActionButton(
                      onPressed: () {},
                      title: StringConstants.strAfterWeek,
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      backgroundColor: ThemeColors.clrSecondary,
                      textColor: ThemeColors.clrPrimary,
                    ),
                  ),
                ],
              ),
              TableCalendar<dynamic>(
                focusedDay: DateTime.now(),
                firstDay: DateTime.utc(2020),
                lastDay: DateTime.utc(2030, 12, 31),
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
        const Divider(color: ThemeColors.clrWhite50),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: <Widget>[
              const Row(
                spacing: 12,
                children: <Widget>[
                  ImageIcon(
                    AssetImage(IconConstants.icCalendar),
                    size: 25,
                    color: ThemeColors.clrPrimary,
                  ),
                  Text(
                    "date",
                    style: TextStyle(
                      fontSize: FontSize.fontSizeRegular,
                      color: ThemeColors.clrBlack50,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text("Cancel"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Navigator.pop(context, state.selectedDate);
                    },
                    child: Text("Save"),
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
