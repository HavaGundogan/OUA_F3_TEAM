import 'package:yourself_in_time_project/app/app.router.dart';
import 'package:yourself_in_time_project/app/app_base_view_model.dart';

class RegisterViewModel extends AppBaseViewModel {
  String _email = '';
  String _password = '';
  String _emailError = '';
  String _passwordError = '';

  String get email => _email;
  String get password => _password;
  String get emailError => _emailError;
  String get passwordError => _passwordError;

  void validateEmail() {
    if (_email.isEmpty) {
      _emailError = 'Lütfen Email giriniz!!!';
    } else if (!_email.endsWith('@gmail.com')) {
      _emailError = 'Lütfen geçerli bir Email giriniz!!!';
    } else {
      _emailError = '';
    }

    notifyListeners();
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

  void setEmail(String value) {
    _email = value;
    validateEmail();
  }

  void setPassword(String value) {
    _password = value;
    validatePassword();
  }

  init() {
    navigationService.navigateTo(Routes.loginView);
  }
}
