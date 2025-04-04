import "package:assignment/core/constants/string_constants.dart";
import "package:assignment/feature/employee_list/domain/entities/employee.dart";
import "package:assignment/feature/employee_list/presentation/cubit/employee_cubit.dart";
import "package:assignment/feature/manage_employee/presentation/cubit/calender_cubit.dart";
import "package:assignment/feature/manage_employee/presentation/cubit/manage_employee_cubit.dart";
import "package:assignment/firebase_options.dart";
import "package:firebase_core/firebase_core.dart";
import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:get_it/get_it.dart";
import "package:hive_flutter/hive_flutter.dart";

final GetIt getIt = GetIt.instance;

Future<void> init() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  await registerHive();

  await SystemChrome.setPreferredOrientations(<DeviceOrientation>[
    DeviceOrientation.portraitUp,
  ]);

  getIt
    ..registerSingleton<EmployeeCubit>(EmployeeCubit())
    ..registerSingleton<ManageEmployeeCubit>(ManageEmployeeCubit())
    ..registerSingleton<CalenderCubit>(CalenderCubit());
}

Future<void> registerHive() async {
  await Hive.initFlutter();
  Hive.registerAdapter(EmployeeAdapter());

  await Hive.openBox<Employee>(MapConstant.mapEmployeeList);
}
