import "package:assignment/feature/employee_list/domain/entities/employee.dart";
import "package:assignment/feature/manage_employee/presentation/cubit/manage_employee_state.dart";
import "package:flutter_bloc/flutter_bloc.dart";

class ManageEmployeeCubit extends Cubit<ManageEmployeeState> {
  ManageEmployeeCubit() : super(ManageEmployeeInitial());

  late Employee manageEmployee;

  void setEmployee(Employee employee) {
    emit(ManageEmployeeInitial());
    manageEmployee = employee;
    emit(ManageEmployeeModified(employee));
  }

  void setEmployeeJobRole(String employeeJobRole) {
    emit(ManageEmployeeInitial());
    manageEmployee.jobRole = employeeJobRole;
    emit(ManageEmployeeModified(manageEmployee));
  }

  Future<void> setEmployeeName(String employeeName) async {
    manageEmployee.employeeName = employeeName;
  }

  void setEmployeeStartDate(DateTime startDate) {
    emit(ManageEmployeeInitial());
    manageEmployee.startDate = startDate;
    emit(ManageEmployeeModified(manageEmployee));
  }

  void setEmployeeEndDate(DateTime endDate) {
    emit(ManageEmployeeInitial());
    manageEmployee.endDate = endDate;
    emit(ManageEmployeeModified(manageEmployee));
  }
}
