// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:yourself_in_time_project/ui/register/register_view.dart';

class VerifyEmailWidget extends StatefulWidget {
  String email, name, password;

  VerifyEmailWidget(
      {Key? key,
      required this.password,
      required this.name,
      required this.email})
      : super(key: key);

  @override
  State<VerifyEmailWidget> createState() => _VerifyEmailWidget();
}

class _VerifyEmailWidget extends State<VerifyEmailWidget> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  bool isEmailVerified = false;
  bool canResendEmail = false;
  Timer? timer;
  @override
  void initState() {
    super.initState();
    isEmailVerified = _auth.currentUser!.emailVerified;

    if (!isEmailVerified) {
      sendVerificationEmail();
      Timer.periodic(Duration(seconds: 3), (_) => checkEmailVerified());
    }
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  Future checkEmailVerified() async {
    await _auth.currentUser!.reload();
    setState(() {
      isEmailVerified = _auth.currentUser!.emailVerified;
    });
    if (isEmailVerified) {
      timer?.cancel();
    }
  }

  Future sendVerificationEmail() async {
    try {
      final user = _auth.currentUser!;
      await user.sendEmailVerification();
      setState(() {
        canResendEmail = false;
      });
      await Future.delayed(Duration(seconds: 5));
      setState(() {
        canResendEmail = true;
      });
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return isEmailVerified
        ? RegisterView()
        : Scaffold(
            appBar: AppBar(
              title: Text("Verify Email"),
            ),
            body: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "A verification email has been sent to your email",
                    style: GoogleFonts.ubuntu(fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      sendVerificationEmail();
                    },
                    icon: Icon(
                      Icons.email,
                      size: 32,
                    ),
                    label: Text(
                      "Resent Email",
                      style: GoogleFonts.ubuntu(fontSize: 24),
                    ),
                    style: ElevatedButton.styleFrom(
                        minimumSize: Size.fromHeight(50)),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      _auth.signOut();
                    },
                    icon: Icon(
                      Icons.email,
                      size: 32,
                    ),
                    label: Text(
                      "Cancel",
                      style: GoogleFonts.ubuntu(fontSize: 24),
                    ),
                    style: ElevatedButton.styleFrom(
                        minimumSize: Size.fromHeight(50)),
                  )
                ],
              ),
            ),
          );
  }
}
