import 'package:flutter/material.dart';
import 'package:yourself_in_time_project/app/yourself_in_time_app.dart';
import 'package:yourself_in_time_project/core/di/get_it.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupDi();
  runApp(const YourselfInTimeApp());
}
