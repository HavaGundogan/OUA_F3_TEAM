import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:yourself_in_time_project/app/app.router.dart';
import 'package:yourself_in_time_project/app/app_base_view_model.dart';

class LoginViewModel extends AppBaseViewModel {
  String _email = '';
  String _password = '';
  String _emailError = '';
  String _passwordError = '';

  String get email => _email;
  String get password => _password;
  String get emailError => _emailError;
  String get passwordError => _passwordError;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

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
            await _firebaseAuth.signInWithCredential(credential);

        final User? user = userCredential.user;

        if (user != null) {
          print('Kullanıcı giriş yaptı. User ID: ${user.uid}');
          navigationService.navigateTo(Routes.mainView);
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

  Future<User?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      final UserCredential userCredential =
          await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      final User? user = userCredential.user;

      if (user != null) {
        print('Kullanıcı giriş yaptı. User ID: ${user.uid}');
        navigationService.navigateTo(Routes.mainView);
      } else {
        return null;
      }
    } catch (e) {
      print('Email ve şifre ile giriş hatası: $e');
      return null;
    }
    return null;
  }

  void validatePassword() {
    if (_password.isEmpty) {
      _passwordError = 'Lütfen Şifrenizi giriniz!!!';
    } else if (_password.length < 5) {
      _passwordError = 'Şifre 5 karakterden az olamaz!!!';
    } else {
      _passwordError = '';
    }

    notifyListeners();
  }

  void setPassword(String value) {
    _password = value;
    validatePassword();
  }

  init() {
    navigationService.navigateTo(Routes.mainView);
  }

  nextForgot() {
    navigationService.navigateTo(Routes.forgotPasswordView);
  }

  nextRegister() {
    navigationService.navigateTo(Routes.registerView);
  }
}
