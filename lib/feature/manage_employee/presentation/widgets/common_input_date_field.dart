import "package:assignment/core/constants/image_constants.dart";
import "package:assignment/core/constants/string_constants.dart";
import "package:assignment/core/constants/theme_constants.dart";
import "package:assignment/core/shared/domain/method/methods.dart";
import "package:assignment/feature/manage_employee/presentation/widgets/common_calendar_picker.dart";
import "package:flutter/material.dart";

class CommonInputDateField extends StatelessWidget {
  const CommonInputDateField({required this.isStartDate, this.date, super.key});

  final DateTime? date;
  final bool isStartDate;

  @override
  Widget build(BuildContext context) => Expanded(
    child: GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder:
              (BuildContext context) => CommonCalendarPicker(
                isStartDate: isStartDate,
                selectedDate: date,
              ),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: ThemeColors.clrWhite100),
        ),
        child: Row(
          spacing: 12,
          children: <Widget>[
            const ImageIcon(
              AssetImage(IconConstants.icCalendar),
              size: 25,
              color: ThemeColors.clrPrimary,
            ),
            Text(
              date != null
                  ? formatToDateMonthYear.format(date!)
                  : StringConstants.strNoDate,
              style: TextStyle(
                fontSize: FontSize.fontSizeRegular,
                color:
                    date == null
                        ? ThemeColors.clrGray100
                        : ThemeColors.clrBlack50,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
