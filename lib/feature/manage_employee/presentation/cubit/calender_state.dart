import "package:assignment/feature/manage_employee/presentation/cubit/calender_cubit.dart";

abstract class CalenderState {}

class CalenderInitial extends CalenderState {}

class CalenderModified extends CalenderState {
  CalenderModified(this.calenderParams);

  final CalenderParams calenderParams;
}
