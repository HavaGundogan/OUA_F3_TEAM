import 'dart:async';
import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:lottie/lottie.dart';
import 'package:yourself_in_time_project/common/constants/colors_constants.dart';
import 'package:yourself_in_time_project/common/widgets/verify_email_page_state_widget.dart';
import 'package:yourself_in_time_project/ui/login/login_view_model.dart';
import 'package:yourself_in_time_project/ui/register/register_view_model.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  bool isEmailVerified = false;
  bool canResendEmail = false;
  Timer? timer;
  final TextEditingController verificationCodeController =
      TextEditingController();

  Future signInAnonymous() async {
    try {
      final result = await _auth.signInAnonymously();
      print(result.user!.uid);
      return result.user;
    } catch (e) {
      print("Anon error $e");
      return null;
    }
  }

  Future<User?> signIn(String email, String password, LoginViewModel model,
      BuildContext context) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      showStyledSnackBar(
          'You are Logged in', context, AnimatedSnackBarType.success);
      if (userCredential.user != null) {
        model.init();
        return userCredential.user;
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        showStyledSnackBar("No User Found with this Email'", context,
            AnimatedSnackBarType.error);
      } else if (e.code == 'wrong-password') {
        showStyledSnackBar(
            'Password did not match', context, AnimatedSnackBarType.error);
      } else {
        showStyledSnackBar(
            'An error occurred', context, AnimatedSnackBarType.error);
      }
    }
    return null;
  }

  Future<User?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      final UserCredential userCredential =
          await _auth.signInWithCredential(credential);
      final User? user = userCredential.user;
      final String email = user!.email!;
      final String displayname = user.displayName!;
      final DateTime lastLoginTime = user.metadata.lastSignInTime!;
      final String password = "";
      await _firestore.collection('users').doc(user.uid).set({
        'email': email,
        'last_login_time': lastLoginTime,
        'name': displayname,
        'password': password
      });

      return user;
    } catch (error) {
      print('Google Sign-In Hatası: $error');
      return null;
    }
  }

  signOut() async {
    await _auth.signOut();
    await _googleSignIn.signOut();
  }

  Future<void> forgotPassword(String email, BuildContext context) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);

      showStyledSnackBar(
        "Lütfen Emailinizi kontrol ediniz!",
        context,
        AnimatedSnackBarType.info,
      );
    } catch (e) {}
  }

  Future<User?> createPerson(String name, String email, String password,
      BuildContext context, RegisterViewModel model) async {
    try {
      var userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      User? user = userCredential.user;

      if (user != null) {
        try {
          final DateTime lastLoginTime = user.metadata.lastSignInTime!;
          isEmailVerified = _auth.currentUser!.emailVerified;
          if (!isEmailVerified) {
            sendVerificationEmail();
            showStyledSnackBar(
              "Onay email e gönderildi ",
              context,
              AnimatedSnackBarType.success,
            );
            Timer.periodic(Duration(seconds: 1), (_) async {
              try {
                await _auth.currentUser!.reload();

                isEmailVerified = _auth.currentUser!.emailVerified;

                if (isEmailVerified) {
                  timer?.cancel();
                  await _firestore.collection('users').doc(user.uid).set(
                      {'email': email, 'name': name, 'password': password});
                  model.init();
                } else {
                  showDialog(
                    context: context,
                    barrierDismissible: false,
                    barrierColor: Colors.transparent,
                    builder: (context) {
                      return Center(
                        child: Container(
                          color: ColorConstants
                              .greyColorShade, // Set the desired background color
                          padding: EdgeInsets.all(16),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Lottie.asset("assets/json/loading.json",
                                  fit: BoxFit.cover, height: 50, width: 80),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }
              } catch (e) {
                signOut();
              }
            });
          } else {
            showStyledSnackBar(
              "Onay Emaili gönderilemedi ",
              context,
              AnimatedSnackBarType.error,
            );
          }
        } catch (e) {
          showStyledSnackBar(
            "Doğrulama başarısız oldu: $e",
            context,
            AnimatedSnackBarType.warning,
          );
        }
      } else {
        showStyledSnackBar(
            "Bir hata oluştu!!!", context, AnimatedSnackBarType.error);
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == "email-already-in-use") {
        showStyledSnackBar(
          "E-posta zaten kullanımda",
          context,
          AnimatedSnackBarType.warning,
        );
      } else {
        showStyledSnackBar(
          "Bir hata oluştu",
          context,
          AnimatedSnackBarType.error,
        );
      }
    }
    return null;
  }

  Future sendVerificationEmail() async {
    try {
      final user = _auth.currentUser!;
      await user.sendEmailVerification();
    } catch (e) {}
  }

  void showStyledSnackBar(
      String message, BuildContext context, AnimatedSnackBarType type) {
    AnimatedSnackBar.material(message,
            type: type,
            mobilePositionSettings:
                const MobilePositionSettings(topOnAppearance: 30))
        .show(context);
  }
}
