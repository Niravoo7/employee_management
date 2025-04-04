import "package:assignment/core/constants/image_constants.dart";
import "package:assignment/core/constants/string_constants.dart";
import "package:assignment/core/constants/theme_constants.dart";
import "package:assignment/feature/employee_list/domain/entities/employee.dart";
import "package:assignment/feature/employee_list/presentation/cubit/employee_cubit.dart";
import "package:assignment/feature/employee_list/presentation/cubit/employee_state.dart";
import "package:assignment/feature/employee_list/presentation/widgets/employee_item.dart";
import "package:assignment/injection_container/injection_container.dart";
import "package:assignment/routes/app_routes.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";

class EmployeeListScreen extends StatelessWidget {
  EmployeeListScreen({super.key});

  final EmployeeCubit _employeeCubit = getIt<EmployeeCubit>();

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: ThemeColors.clrWhite50,
    appBar: AppBar(title: const Text(StringConstants.strEmployeeList)),
    body: SafeArea(
      child: RefreshIndicator(
        onRefresh: () async {
          await _employeeCubit.loadEmployees();
        },
        child: BlocBuilder<EmployeeCubit, EmployeeState>(
          builder: (BuildContext context, EmployeeState state) {
            if (state is EmployeeLoading) {
              return const SizedBox.shrink();
            }

            if (state is EmployeeLoaded) {
              if (state.employees.isEmpty) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                        ImageConstants.imgNoData,
                        height: 170.h,
                        fit: BoxFit.fill,
                      ),
                      const Text(
                        StringConstants.strNoRecordsFound,
                        style: TextStyle(
                          fontSize: FontSize.fontSizeLarge,
                          color: ThemeColors.clrBlack50,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                );
              } else {
                final List<Employee> currentList =
                    state.employees
                        .where((Employee element) => element.endDate == null)
                        .toList();

                final List<Employee> previousList =
                    state.employees
                        .where((Employee element) => element.endDate != null)
                        .toList();

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      child: ListView(
                        children: <Widget>[
                          ExpansionTile(
                            childrenPadding: EdgeInsets.zero,
                            showTrailingIcon: false,
                            initiallyExpanded: true,
                            title: const Text(
                              StringConstants.strCurrentEmployees,
                              style: TextStyle(
                                fontSize: FontSize.fontSizeMedium,
                                fontWeight: FontWeight.w500,
                                color: ThemeColors.clrPrimary,
                              ),
                            ),
                            children:
                                currentList
                                    .map(
                                      (Employee item) =>
                                          EmployeeItem(employee: item),
                                    )
                                    .toList(),
                          ),
                          ExpansionTile(
                            childrenPadding: EdgeInsets.zero,
                            showTrailingIcon: false,
                            initiallyExpanded: true,
                            title: const Text(
                              StringConstants.strPreviousEmployees,
                              style: TextStyle(
                                fontSize: FontSize.fontSizeMedium,
                                fontWeight: FontWeight.w500,
                                color: ThemeColors.clrPrimary,
                              ),
                            ),
                            children:
                                previousList
                                    .map(
                                      (Employee item) =>
                                          EmployeeItem(employee: item),
                                    )
                                    .toList(),
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(16),
                      child: Text(
                        StringConstants.strSwipeLeftDelete,
                        style: TextStyle(
                          fontSize: FontSize.fontSize15,
                          color: ThemeColors.clrGray100,
                        ),
                      ),
                    ),
                  ],
                );
              }
            }

            return const SizedBox.shrink();
          },
        ),
      ),
    ),
    floatingActionButton: FloatingActionButton(
      onPressed: () {
        Navigator.pushNamed(context, AppRoutes.addDetailsRoute);
      },
      child: const Icon(Icons.add, size: 32),
    ),
  );
}
