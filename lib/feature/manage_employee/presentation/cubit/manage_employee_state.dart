abstract class ManageEmployeeState {}

class ManageEmployeeInitial extends ManageEmployeeState {}

class ManageEmployeeLoading extends ManageEmployeeState {}

class ManageEmployeeLoaded extends ManageEmployeeState {}

class ManageEmployeeError extends ManageEmployeeState {
  ManageEmployeeError(this.message);

  final String message;
}
