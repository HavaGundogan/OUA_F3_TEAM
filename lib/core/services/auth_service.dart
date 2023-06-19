import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

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

  Future<String?> signIn(String email, String password) async {
    String? res;
    try {
      final result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      res = "success";
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        res = "Kullanici adi veya Sifre Yanlis";
      } else if (e.code == "wrong-password") {
        res = "Sifre Yanlis";
      } else if (e.code == "user-disabled") {
        res = "Kullanici Pasif";
      }

      return res;
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
