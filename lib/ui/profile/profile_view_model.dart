import 'package:yourself_in_time_project/app/app.router.dart';
import 'package:yourself_in_time_project/app/app_base_view_model.dart';

class ProfileViewModel extends AppBaseViewModel {
  init() {}
  backLogin() {
    navigationService.navigateTo(Routes.loginView);
  }
}
