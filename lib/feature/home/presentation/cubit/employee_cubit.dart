import "package:assignment/core/constants/string_constants.dart";
import "package:assignment/feature/home/domain/entities/employee.dart";
import "package:assignment/feature/home/presentation/cubit/employee_state.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:hive/hive.dart";

class EmployeeCubit extends Cubit<EmployeeState> {
  EmployeeCubit() : super(EmployeeInitial());

  // Hive box for Employee
  late Box<Employee> employeeBox;

  Future<void> loadEmployees() async {
    try {
      emit(EmployeeLoading());
      // Open the Hive box
      employeeBox = await Hive.openBox<Employee>(MapConstant.mapEmployeeList);
      // Fetch all employees from Hive
      final List<Employee> employees = employeeBox.values.toList();
      emit(EmployeeLoaded(employees));
    } catch (e) {
      emit(EmployeeError("Failed to load employees: $e"));
    }
  }

  Future<void> addEmployee(Employee employee) async {
    try {
      employee.employeeId ??= DateTime.now().millisecond.toString();
      await employeeBox.put(employee.employeeId, employee);
      await loadEmployees(); // Refresh employee list after adding
    } catch (e) {
      emit(EmployeeError("Failed to add employee: $e"));
    }
  }

  Future<void> updateEmployee(Employee employee) async {
    try {
      await employeeBox.put(employee.employeeId, employee);
      await loadEmployees(); // Refresh employee list after updating
    } catch (e) {
      emit(EmployeeError("Failed to update employee: $e"));
    }
  }

  Future<void> deleteEmployee(String employeeId) async {
    try {
      await employeeBox.delete(employeeId);
      await loadEmployees(); // Refresh employee list after deletion
    } catch (e) {
      emit(EmployeeError("Failed to delete employee: $e"));
    }
  }
}
