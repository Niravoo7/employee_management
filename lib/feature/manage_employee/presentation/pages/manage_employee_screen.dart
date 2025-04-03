import "package:assignment/core/constants/image_constants.dart";
import "package:assignment/core/constants/string_constants.dart";
import "package:assignment/core/constants/theme_constants.dart";
import "package:assignment/core/shared/presentation/widget/action_button.dart";
import "package:assignment/core/shared/presentation/widget/text_field.dart";
import "package:assignment/feature/employee_list/domain/entities/employee.dart";
import "package:assignment/feature/employee_list/presentation/cubit/employee_cubit.dart";
import "package:assignment/feature/manage_employee/presentation/widgets/common_input_date_field.dart";
import "package:assignment/feature/manage_employee/presentation/widgets/select_role_bottom_sheet.dart";
import "package:assignment/injection_container/injection_container.dart";
import "package:flutter/material.dart";

class ManageEmployeeScreen extends StatelessWidget {
  ManageEmployeeScreen({super.key});

  final EmployeeCubit _employeeCubit = getIt<EmployeeCubit>();

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text(StringConstants.strAddEmployeeDetails)),
    body: SafeArea(
      child: Column(
        children: <Widget>[
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: Column(
                spacing: 20,
                children: <Widget>[
                  CommonTextField(
                    controller: TextEditingController(),
                    prefixIcon: Icons.person_outline_sharp,
                    hint: StringConstants.strEmployeeName,
                    textInputAction: TextInputAction.done,
                  ),
                  ListTile(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        useSafeArea: true,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(16),
                          ),
                        ),
                        builder: (_) => SelectRoleBottomSheet(),
                      );
                    },
                    contentPadding: const EdgeInsets.only(left: 12),
                    dense: true,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                      side: const BorderSide(color: ThemeColors.clrWhite100),
                    ),
                    leading: const ImageIcon(
                      AssetImage(IconConstants.icBag),
                      size: 25,
                      color: ThemeColors.clrPrimary,
                    ),
                    title: const Text(
                      StringConstants.strSelectRole,
                      style: TextStyle(
                        fontSize: FontSize.fontSizeMedium,
                        color: ThemeColors.clrGray100,
                      ),
                    ),
                    trailing: const Icon(
                      Icons.arrow_drop_down_rounded,
                      size: 40,
                      color: ThemeColors.clrPrimary,
                    ),
                  ),
                  Row(
                    spacing: 20,
                    children: <Widget>[
                      CommonInputDateField(
                        dateTime: DateTime.now(),
                        isStartDate: true,
                      ),
                      const ImageIcon(
                        AssetImage(IconConstants.icArrowRight),
                        color: ThemeColors.clrPrimary,
                      ),
                      CommonInputDateField(isStartDate: false),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Material(
            color: ThemeColors.clrWhite,
            shape: const Border(
              top: BorderSide(color: ThemeColors.clrWhite50, width: 2),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                spacing: 20,
                children: <Widget>[
                  ActionButton(
                    onPressed: () {},
                    title: StringConstants.strCancel,
                    backgroundColor: ThemeColors.clrSecondary,
                    textColor: ThemeColors.clrPrimary,
                  ),
                  ActionButton(
                    onPressed: () {
                      _employeeCubit.addEmployee(
                        Employee(
                          employeeName: "abc",
                          jobRole: "Flutter Developer",
                          startDate: DateTime.now(),
                        ),
                      );
                    },
                    title: StringConstants.strSave,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
