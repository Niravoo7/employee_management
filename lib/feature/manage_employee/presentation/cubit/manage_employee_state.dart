import "package:assignment/feature/employee_list/domain/entities/employee.dart";

abstract class ManageEmployeeState {}

class ManageEmployeeInitial extends ManageEmployeeState {}

class ManageEmployeeModified extends ManageEmployeeState {
  ManageEmployeeModified(this.employee);

  final Employee employee;
}
