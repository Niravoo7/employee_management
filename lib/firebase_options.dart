// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDMgRZYp2QPa2zJ0dISQGhVVbLUWwI3w-0',
    appId: '1:933233959260:web:3f1ce69d35bdf8e495e199',
    messagingSenderId: '933233959260',
    projectId: 'employeemanager-5fdbf',
    authDomain: 'employeemanager-5fdbf.firebaseapp.com',
    storageBucket: 'employeemanager-5fdbf.firebasestorage.app',
    measurementId: 'G-80E9ME11XV',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAZHotorLG21JCqKrsYU--kPtL3unBklUE',
    appId: '1:933233959260:android:538c11acf9c9039595e199',
    messagingSenderId: '933233959260',
    projectId: 'employeemanager-5fdbf',
    storageBucket: 'employeemanager-5fdbf.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDzN1L_ViDMuAozzDDSFKpWt2jjA6ALI50',
    appId: '1:933233959260:ios:68c461d70ab4838195e199',
    messagingSenderId: '933233959260',
    projectId: 'employeemanager-5fdbf',
    storageBucket: 'employeemanager-5fdbf.firebasestorage.app',
    iosBundleId: 'com.app.employee.manager',
  );

}