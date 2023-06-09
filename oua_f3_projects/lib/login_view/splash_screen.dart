import 'dart:async';
import 'package:flutter/material.dart';
import 'login_page.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(8), // Dört kenardan 8 birim boşluk bırakır
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/splash3.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: null,
      ),
    );
  }
}
