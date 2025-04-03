import "package:hive/hive.dart";

part "employee.g.dart";

@HiveType(typeId: 0)
class Employee {
  Employee({
    required this.employeeName,
    required this.jobRole,
    required this.startDate,
    this.employeeId,
    this.endDate,
  });

  @HiveField(0)
  String? employeeId;
  @HiveField(1)
  String employeeName;
  @HiveField(2)
  String jobRole;
  @HiveField(3)
  DateTime startDate;
  @HiveField(4)
  DateTime? endDate;
}
