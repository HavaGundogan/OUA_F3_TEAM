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
    navigationService.navigateTo(Routes.homeView);
  }

  nextForgot() {
    navigationService.navigateTo(Routes.forgotPasswordView);
  }

  nextRegister() {
    navigationService.navigateTo(Routes.registerView);
  }

  backLogin() {
    navigationService.back();
  }
}
