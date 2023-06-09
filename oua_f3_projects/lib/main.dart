import 'package:flutter/material.dart';


import 'login_view/splash_screen.dart'; // Splash ekranının dosya yolunu buraya ekleyin.

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Your App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(), // Ana ekran yerine Splash ekranınızı göstermek için çağırın.
    );
  }
}
