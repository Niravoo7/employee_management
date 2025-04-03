import "package:assignment/feature/manage_employee/presentation/cubit/manage_employee_state.dart";
import "package:flutter_bloc/flutter_bloc.dart";

class ManageEmployeeCubit extends Cubit<ManageEmployeeState> {
  ManageEmployeeCubit() : super(ManageEmployeeInitial());
}
