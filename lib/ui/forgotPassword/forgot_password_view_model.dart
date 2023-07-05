import 'package:firebase_auth/firebase_auth.dart';
import 'package:yourself_in_time_project/app/app.router.dart';
import 'package:yourself_in_time_project/app/app_base_view_model.dart';

class FargotPasswordViewModel extends AppBaseViewModel {
  init() {
    navigationService.navigateTo(Routes.loginView);
  }
}
