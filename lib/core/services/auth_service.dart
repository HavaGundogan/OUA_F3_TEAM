import 'dart:async';
import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:yourself_in_time_project/ui/login/login_view_model.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  Timer? _timer;

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

      model.init();
      DocumentReference userRef =
          _firestore.collection("users").doc(userCredential.user!.email);
      await userRef.update({"last_login_time": FieldValue.serverTimestamp()});
      return userCredential.user;
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

  Future forgotPassword(String email) async {
    try {
      final result = await _auth.sendPasswordResetEmail(email: email);
      print("Mail kutunuzu kontrol ediniz");
    } catch (e) {}
  }

  Future<User?> createPerson(
      String name, String email, String password, BuildContext context) async {
    try {
      var user = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      await _firestore.collection("users").doc(user.user!.uid).set({
        "name": name,
        "email": email,
        "last_login_time": FieldValue.serverTimestamp(),
        "password": password.characters.hashCode
      });
      return user.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == "email-already-in-use") {
        showStyledSnackBar(
            "email-already-use", context, AnimatedSnackBarType.warning);
      } else
        showStyledSnackBar("Wrong", context, AnimatedSnackBarType.error);
    }
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
