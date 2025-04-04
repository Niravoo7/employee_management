import "package:assignment/feature/employee_list/domain/entities/employee.dart";
import "package:assignment/feature/manage_employee/presentation/cubit/calender_cubit.dart";
import "package:assignment/feature/manage_employee/presentation/cubit/manage_employee_cubit.dart";

abstract class CalenderState {}

class CalenderInitial extends CalenderState {}

class CalenderModified extends CalenderState {
  CalenderModified(this.calenderParams);

  final CalenderParams calenderParams;
}
