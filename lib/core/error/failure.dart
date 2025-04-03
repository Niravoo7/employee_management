import "package:equatable/equatable.dart";

abstract class Failure extends Equatable {
  @override
  List<Object> get props => <Object>[];
}

class ServerFailure extends Failure {
  ServerFailure({required this.error});

  final String error;
}

class CacheFailure extends Failure {}

class GeneralFailure extends Failure {
  GeneralFailure({required this.error});

  final String error;
}
