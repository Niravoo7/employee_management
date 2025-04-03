import "package:flutter/material.dart";
import "package:flutter/services.dart";

Future<void> init() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations(<DeviceOrientation>[
    DeviceOrientation.portraitUp,
  ]);
}
