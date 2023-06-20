import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:stacked_services/stacked_services.dart';
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

  Future<User?> signIn(
      String email, String password, LoginViewModel model) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      if (userCredential.user != null) {
        model.init();
      } else {
        print("Kullanıcı girişi sağlanamadı");
      }
    } catch (e) {
      print(e);
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

    Future<User?> createPerson(
        String name, String email, String password) async {
      var user = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      await _firestore.collection("user").doc(user.user!.uid).set({
        "name": name,
        "email": email,
      });
      return user.user;
    }
  }
}
