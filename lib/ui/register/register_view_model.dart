import 'package:yourself_in_time_project/app/app.router.dart';
import 'package:yourself_in_time_project/app/app_base_view_model.dart';

class RegisterViewModel extends AppBaseViewModel {
  init() {
    navigationService.navigateTo(Routes.mainView);
  }

  loginPage() {
    navigationService.navigateTo(Routes.loginView);
  }

  backPage() {
    navigationService.back();
  }
}
