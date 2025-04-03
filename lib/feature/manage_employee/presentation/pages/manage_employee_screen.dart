import "package:assignment/core/constants/image_constants.dart";
import "package:assignment/core/constants/string_constants.dart";
import "package:assignment/core/constants/theme_constants.dart";
import "package:assignment/core/shared/presentation/widget/action_button.dart";
import "package:assignment/core/shared/presentation/widget/text_field.dart";
import "package:assignment/feature/employee_list/domain/entities/employee.dart";
import "package:assignment/feature/employee_list/presentation/cubit/employee_cubit.dart";
import "package:assignment/feature/manage_employee/presentation/cubit/manage_employee_cubit.dart";
import "package:assignment/feature/manage_employee/presentation/cubit/manage_employee_state.dart";
import "package:assignment/feature/manage_employee/presentation/widgets/common_input_date_field.dart";
import "package:assignment/feature/manage_employee/presentation/widgets/select_role_bottom_sheet.dart";
import "package:assignment/injection_container/injection_container.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";

class ManageEmployeeScreen extends StatefulWidget {
  const ManageEmployeeScreen({this.employee, super.key});

  final Employee? employee;

  @override
  State<ManageEmployeeScreen> createState() => _ManageEmployeeScreenState();
}

class _ManageEmployeeScreenState extends State<ManageEmployeeScreen> {
  final EmployeeCubit _employeeCubit = getIt<EmployeeCubit>();
  final ManageEmployeeCubit _manageEmployeeCubit = getIt<ManageEmployeeCubit>();
  TextEditingController employeeNameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _manageEmployeeCubit.setEmployee(
      (widget.employee != null)
          ? widget.employee!
          : Employee(
            employeeName: "",
            jobRole: null,
            startDate: DateTime.now(),
          ),
    );

    employeeNameController.text =
        _manageEmployeeCubit.manageEmployee.employeeName;
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text(
        widget.employee == null
            ? StringConstants.strAddEmployeeDetails
            : StringConstants.strEditEmployeeDetails,
      ),
      actions: <Widget>[
        if (widget.employee != null)
          Padding(
            padding: const EdgeInsets.only(right: 5),
            child: IconButton(
              onPressed: () {
                _employeeCubit.deleteEmployee(
                  widget.employee?.employeeId ?? "",
                );
                Navigator.pop(context);
              },
              icon: const ImageIcon(AssetImage(IconConstants.icDelete)),
            ),
          ),
      ],
    ),
    body: SafeArea(
      child: BlocBuilder<ManageEmployeeCubit, ManageEmployeeState>(
        builder:
            (BuildContext context, ManageEmployeeState state) => Column(
              children: <Widget>[
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 20,
                    ),
                    child: Column(
                      spacing: 20,
                      children: <Widget>[
                        CommonTextField(
                          controller: employeeNameController,
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
                              builder:
                                  (_) => SelectRoleBottomSheet(
                                    selectedJobRole: (String jobRole) {
                                      _manageEmployeeCubit.setEmployeeJobRole(
                                        jobRole,
                                      );
                                    },
                                  ),
                            );
                          },
                          contentPadding: const EdgeInsets.only(left: 12),
                          dense: true,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                            side: const BorderSide(
                              color: ThemeColors.clrWhite100,
                            ),
                          ),
                          leading: const ImageIcon(
                            AssetImage(IconConstants.icBag),
                            size: 25,
                            color: ThemeColors.clrPrimary,
                          ),
                          title: Text(
                            _manageEmployeeCubit.manageEmployee.jobRole ??
                                StringConstants.strSelectRole,
                            style: TextStyle(
                              fontSize: FontSize.fontSizeMedium,
                              color:
                                  (_manageEmployeeCubit
                                              .manageEmployee
                                              .jobRole !=
                                          null)
                                      ? ThemeColors.clrBlack50
                                      : ThemeColors.clrGray100,
                            ),
                          ),
                          trailing: const Icon(
                            Icons.arrow_drop_down_rounded,
                            size: 40,
                            color: ThemeColors.clrPrimary,
                          ),
                        ),
                        const Row(
                          spacing: 20,
                          children: <Widget>[
                            CommonInputDateField(isStartDate: true),
                            ImageIcon(
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
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    child: Row(
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
                            _manageEmployeeCubit.setEmployeeName(
                              employeeNameController.text,
                            );
                            _employeeCubit.addEmployee(
                              _manageEmployeeCubit.manageEmployee,
                            );
                            Navigator.pop(context);
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
    ),
  );
}
