import "package:assignment/feature/home/presentation/pages/add_details_screen.dart";
import "package:assignment/feature/home/presentation/pages/home_screen.dart";
import "package:flutter/material.dart";

class AppRoutes {
  static const String homeRoute = "/";
  static const String addDetailsRoute = "/addDetailsRoute";

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeRoute:
        return MaterialPageRoute<dynamic>(builder: (_) => const HomeScreen());
      case addDetailsRoute:
        return MaterialPageRoute<dynamic>(
          builder: (_) => const AddDetailsScreen(),
        );
      default:
        return MaterialPageRoute<dynamic>(builder: (_) => const HomeScreen());
    }
  }
}
