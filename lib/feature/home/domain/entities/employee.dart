class Employee {
  Employee({
    required this.name,
    required this.jobRole,
    required this.joinDate,
    this.leaveDate,
  });

  final String name;
  final String jobRole;
  final DateTime joinDate;
  final DateTime? leaveDate;
}
