import "package:assignment/core/constants/image_constants.dart";
import "package:assignment/core/constants/string_constants.dart";
import "package:assignment/core/constants/theme_constants.dart";
import "package:assignment/core/shared/domain/method/methods.dart";
import "package:assignment/core/utils/utils.dart";
import "package:assignment/feature/employee_list/domain/entities/employee.dart";
import "package:assignment/routes/app_routes.dart";
import "package:flutter/material.dart";

class EmployeeItem extends StatelessWidget {
  const EmployeeItem({required this.employee, super.key});

  final Employee employee;

  @override
  Widget build(BuildContext context) => GestureDetector(
    onTap: () {
      Navigator.pushNamed(
        context,
        AppRoutes.addDetailsRoute,
        arguments: employee,
      );
    },
    child: Container(
      color: ThemeColors.clrWhite,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            width: double.maxFinite,
            child: Dismissible(
              key: Key(employee.employeeId ?? ""),
              direction: DismissDirection.endToStart,
              onDismissed: (DismissDirection direction) {
                showSnackBar(
                  context,
                  title: StringConstants.strEmployeeDataHasBeenDeleted,
                  action: SnackBarAction(
                    onPressed: () {},
                    label: StringConstants.strUndo,
                    textColor: ThemeColors.clrPrimary,
                  ),
                );
              },
              background: const SizedBox.shrink(),
              secondaryBackground: Container(
                padding: const EdgeInsets.only(right: 20),
                color: ThemeColors.clrError,
                alignment: Alignment.centerRight,
                child: const ImageIcon(
                  AssetImage(IconConstants.icDelete),
                  color: ThemeColors.clrWhite,
                  size: 28,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 6,
                  children: <Widget>[
                    Text(
                      employee.employeeName,
                      style: const TextStyle(
                        fontSize: FontSize.fontSizeMedium,
                        fontWeight: FontWeight.w500,
                        color: ThemeColors.clrBlack50,
                      ),
                    ),
                    Text(
                      employee.jobRole,
                      style: const TextStyle(
                        fontSize: FontSize.fontSizeRegular,
                        color: ThemeColors.clrGray100,
                      ),
                    ),
                    Text(
                      employee.endDate == null
                          ? "${StringConstants.strFrom} ${formatToDateMonth.format(employee.startDate)}"
                          : "${formatToDateMonth.format(employee.startDate)} - ${formatToDateMonth.format(employee.endDate!)}",
                      style: const TextStyle(
                        fontSize: FontSize.fontSizeSmall,
                        color: ThemeColors.clrGray100,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const Divider(height: 0, color: ThemeColors.clrWhite50),
        ],
      ),
    ),
  );
}
