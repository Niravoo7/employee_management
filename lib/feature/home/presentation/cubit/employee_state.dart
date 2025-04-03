import "package:assignment/feature/home/domain/entities/employee.dart";

abstract class EmployeeState {}

class EmployeeInitial extends EmployeeState {}

class EmployeeLoading extends EmployeeState {}

class EmployeeLoaded extends EmployeeState {
  EmployeeLoaded(this.employees);

  final List<Employee> employees;
}

class EmployeeError extends EmployeeState {
  EmployeeError(this.message);

  final String message;
}
