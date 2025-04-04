import "package:assignment/core/constants/image_constants.dart";
import "package:assignment/core/constants/string_constants.dart";
import "package:assignment/core/constants/theme_constants.dart";
import "package:assignment/core/shared/domain/method/methods.dart";
import "package:assignment/core/utils/date_utils.dart";
import "package:assignment/feature/manage_employee/presentation/cubit/manage_employee_cubit.dart";
import "package:assignment/feature/manage_employee/presentation/cubit/manage_employee_state.dart";
import "package:assignment/feature/manage_employee/presentation/widgets/common_calendar_picker.dart";
import "package:assignment/injection_container/injection_container.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";

class CommonInputDateField extends StatefulWidget {
  const CommonInputDateField({required this.isStartDate, super.key});

  final bool isStartDate;

  @override
  State<CommonInputDateField> createState() => _CommonInputDateFieldState();
}

class _CommonInputDateFieldState extends State<CommonInputDateField> {
  final ManageEmployeeCubit _manageEmployeeCubit = getIt<ManageEmployeeCubit>();

  @override
  Widget build(BuildContext context) => Expanded(
    child: GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
        showDialog(
          context: context,
          builder:
              (BuildContext context) => CommonCalendarPicker(
                isStartDate: widget.isStartDate,
                selectedDate:
                    (widget.isStartDate)
                        ? _manageEmployeeCubit.manageEmployee.startDate
                        : _manageEmployeeCubit.manageEmployee.endDate ??
                            DateTime(0),
                onDateSelected: (DateTime dateTime) {
                  if (widget.isStartDate) {
                    _manageEmployeeCubit.setEmployeeStartDate(dateTime);
                  } else {
                    _manageEmployeeCubit.setEmployeeEndDate(dateTime);
                  }
                },
              ),
        );
      },
      child: BlocBuilder<ManageEmployeeCubit, ManageEmployeeState>(
        builder: (BuildContext context, ManageEmployeeState state) {
          final DateTime selectedDateTime =
              (widget.isStartDate)
                  ? _manageEmployeeCubit.manageEmployee.startDate
                  : _manageEmployeeCubit.manageEmployee.endDate ?? DateTime(0);
          return Container(
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
          );
        },
      ),
    ),
  );
}
