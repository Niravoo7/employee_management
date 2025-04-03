import "package:assignment/core/constants/image_constants.dart";
import "package:assignment/core/constants/string_constants.dart";
import "package:assignment/core/constants/theme_constants.dart";
import "package:assignment/core/shared/domain/method/methods.dart";
import "package:assignment/core/utils/date_utils.dart";
import "package:assignment/feature/manage_employee/presentation/widgets/common_calendar_picker.dart";
import "package:flutter/material.dart";

class CommonInputDateField extends StatefulWidget {
  CommonInputDateField({required this.isStartDate, this.dateTime, super.key});

  DateTime? dateTime;
  final bool isStartDate;

  @override
  State<CommonInputDateField> createState() => _CommonInputDateFieldState();
}

class _CommonInputDateFieldState extends State<CommonInputDateField> {
  late DateTime selectedDateTime =
      (widget.isStartDate) ? DateTime.now() : DateTime(0);

  @override
  Widget build(BuildContext context) => Expanded(
    child: GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder:
              (BuildContext context) => CommonCalendarPicker(
                isStartDate: widget.isStartDate,
                selectedDate: selectedDateTime,
                onDateSelected: (DateTime dateTime) {
                  selectedDateTime = dateTime;
                  setState(() {});
                },
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
              selectedDateTime != DateTime(0)
                  ? isToday(selectedDateTime)
                      ? StringConstants.strToday
                      : formatToDateMonthYear.format(selectedDateTime)
                  : StringConstants.strNoDate,
              style: TextStyle(
                fontSize: FontSize.fontSizeRegular,
                color:
                    selectedDateTime == DateTime(0)
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
