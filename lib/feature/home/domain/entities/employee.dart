import "package:hive/hive.dart";

part "employee.g.dart";

@HiveType(typeId: 0)
class Employee {
  Employee({
    required this.employeeName,
    required this.jobRole,
    required this.startDate,
    this.endDate,
  });

  @HiveField(0)
  final String employeeName;
  @HiveField(1)
  final String jobRole;
  @HiveField(2)
  final DateTime startDate;
  @HiveField(3)
  final DateTime? endDate;
}
