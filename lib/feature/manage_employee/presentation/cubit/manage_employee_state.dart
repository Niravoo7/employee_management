import "package:assignment/feature/employee_list/domain/entities/employee.dart";
import "package:assignment/feature/manage_employee/presentation/cubit/manage_employee_cubit.dart";

abstract class ManageEmployeeState {}

class ManageEmployeeInitial extends ManageEmployeeState {}

class ManageEmployeeModified extends ManageEmployeeState {
  ManageEmployeeModified(this.employee);

  final Employee employee;
}
