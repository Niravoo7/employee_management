import "package:assignment/feature/employee_list/presentation/pages/employee_list_screen.dart";
import "package:assignment/feature/manage_employee/presentation/pages/manage_employee_screen.dart";
import "package:flutter/material.dart";

class AppRoutes {
  static const String homeRoute = "/";
  static const String addDetailsRoute = "/addDetailsRoute";

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeRoute:
        return MaterialPageRoute<dynamic>(
          builder: (_) => const EmployeeListScreen(),
        );
      case addDetailsRoute:
        return MaterialPageRoute<dynamic>(
          builder: (_) => ManageEmployeeScreen(),
        );
      default:
        return MaterialPageRoute<dynamic>(
          builder: (_) => const EmployeeListScreen(),
        );
    }
  }
}
