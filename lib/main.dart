import "package:assignment/injection_container/injection_container.dart";
import "package:assignment/my_app.dart";
import "package:flutter/material.dart";

Future<void> main() async {
  await init();
  runApp(const MyApp());
}
