import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yourself_in_time_project/app/yourself_in_time_app.dart';
import 'package:yourself_in_time_project/core/di/get_it.dart';
import 'package:yourself_in_time_project/firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  setupDi();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const YourselfInTimeApp());
}
