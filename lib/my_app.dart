
import "package:assignment/core/constants/string_constants.dart";
import "package:assignment/core/constants/theme_constants.dart";
import "package:assignment/core/shared/domain/method/methods.dart";
import "package:assignment/routes/app_routes.dart";
import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    preLoadImages(context);
    return ScreenUtilInit(
      minTextAdapt: true,
      ensureScreenSize: true,
      child: MaterialApp(
        title: StringConstants.appName,
        debugShowCheckedModeBanner: false,
        theme: lightTheme(context),
        builder: (BuildContext context, Widget? child) {
          final MediaQueryData mediaQueryData = MediaQuery.of(context);
          final double scale = mediaQueryData.textScaler
              .scale(1)
              .clamp(1.0, 1.0);
          return MediaQuery(
            data: MediaQuery.of(
              context,
            ).copyWith(textScaler: TextScaler.linear(scale), boldText: false),
            child: child!,
          );
        },
        initialRoute: AppRoutes.homeRoute,
        onGenerateRoute: AppRoutes.generateRoute,
      ),
    );
  }
}
