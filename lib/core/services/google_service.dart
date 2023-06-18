import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:yourself_in_time_project/app/app.router.dart';

class GoogleService {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Future<User?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      if (googleUser != null) {
        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        final UserCredential userCredential =
            await _auth.signInWithCredential(credential);

        final User? user = userCredential.user;

        if (user != null) {
          print('Kullanıcı giriş yaptı. User ID: ${user.uid}');
        } else {
          print('Kullanıcı giriş yapamadı.');
        }
      } else {
        return null;
      }
    } catch (e) {
      print('Google ile giriş hatası: ${e.toString()}');
      return null;
    }
  }
}
