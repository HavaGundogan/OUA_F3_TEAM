import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:yourself_in_time_project/common/constants/colors_constants.dart';
import 'package:yourself_in_time_project/ui/login/login_view_model.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
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
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('You are Logged in'),
          backgroundColor: ColorConstants.snackBarBackgroundColor));

      model.init();
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('No User Found with this Email'),
            backgroundColor: ColorConstants.snackBarBackgroundColorError));
      } else if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Password did not match'),
          backgroundColor: ColorConstants.snackBarBackgroundColorError,
        ));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('An error occurred'),
          backgroundColor: ColorConstants.snackBarBackgroundColorError,
        ));
      }
    }
    return null;
  }

  Future<UserCredential?> signInWithGoogle() async {
    try {
      // Google Sign-In işlemini tetikleyin
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // İstekten kimlik doğrulama ayrıntılarını alın
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      // Yeni bir kimlik bilgisi oluşturun
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Oturum açma işlemini gerçekleştirin ve UserCredential döndürün
      final UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);
      return userCredential;
    } catch (error) {
      // Hata durumunda işlemleri yönetin
      print('Google Sign-In Hatası: $error');
      return null;
    }
  }

  signOut() async {
    return await _auth.signOut();
  }

  Future forgotPassword(String email) async {
    try {
      final result = await _auth.sendPasswordResetEmail(email: email);
      print("Mail kutunuzu kontrol ediniz");
    } catch (e) {}
  }

  Future<User?> createPerson(String name, String email, String password) async {
    var user = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
    await _firestore.collection("user").doc(user.user!.uid).set({
      "name": name,
      "email": email,
    });
    return user.user;
  }
}
