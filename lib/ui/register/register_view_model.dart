import 'package:yourself_in_time_project/app/app.router.dart';
import 'package:yourself_in_time_project/app/app_base_view_model.dart';
import 'package:yourself_in_time_project/core/services/auth_service.dart';

class RegisterViewModel extends AppBaseViewModel {
  init() {
    navigationService.navigateTo(Routes.loginView);
  }
}
