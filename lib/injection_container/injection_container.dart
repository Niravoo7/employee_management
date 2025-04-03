import "package:assignment/core/constants/string_constants.dart";
import "package:assignment/feature/employee_list/domain/entities/employee.dart";
import "package:assignment/feature/employee_list/presentation/cubit/employee_cubit.dart";
import "package:assignment/feature/manage_employee/presentation/cubit/manage_employee_cubit.dart";
import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:get_it/get_it.dart";
import "package:hive_flutter/hive_flutter.dart";

final GetIt getIt = GetIt.instance;

Future<void> init() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await registerHive();

  await SystemChrome.setPreferredOrientations(<DeviceOrientation>[
    DeviceOrientation.portraitUp,
  ]);

  getIt
    ..registerSingleton<EmployeeCubit>(EmployeeCubit())
    ..registerSingleton<ManageEmployeeCubit>(ManageEmployeeCubit());
}

Future<void> registerHive() async {
  Hive.registerAdapter(EmployeeAdapter());

  await Hive.openBox<Employee>(MapConstant.mapEmployeeList);
}
