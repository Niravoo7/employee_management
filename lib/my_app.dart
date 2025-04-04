import "package:assignment/core/constants/string_constants.dart";
import "package:assignment/core/constants/theme_constants.dart";
import "package:assignment/core/shared/domain/method/methods.dart";
import "package:assignment/feature/employee_list/presentation/cubit/employee_cubit.dart";
import "package:assignment/feature/manage_employee/presentation/cubit/calender_cubit.dart";
import "package:assignment/feature/manage_employee/presentation/cubit/manage_employee_cubit.dart";
import "package:assignment/injection_container/injection_container.dart";
import "package:assignment/routes/app_routes.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:nested/nested.dart";

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    preLoadImages(context);
    return ScreenUtilInit(
      minTextAdapt: true,
      ensureScreenSize: true,
      child: MultiBlocProvider(
        providers: <SingleChildWidget>[
          BlocProvider<EmployeeCubit>(
            create: (BuildContext context) => getIt<EmployeeCubit>(),
          ),
          BlocProvider<ManageEmployeeCubit>(
            create: (BuildContext context) => getIt<ManageEmployeeCubit>(),
          ),
          BlocProvider<CalenderCubit>(
            create: (BuildContext context) => getIt<CalenderCubit>(),
          ),
        ],
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
      ),
    );
  }
}
