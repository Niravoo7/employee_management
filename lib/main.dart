import "package:assignment/core/constants/string_constants.dart";
import "package:assignment/core/constants/theme_constants.dart";
import "package:assignment/core/shared/domain/method/methods.dart";
import "package:assignment/injection_container/injection_container.dart";
import "package:assignment/my_app.dart";
import "package:assignment/routes/app_routes.dart";
import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";

Future<void> main() async {
  await init();
  runApp(const MyApp());
}
