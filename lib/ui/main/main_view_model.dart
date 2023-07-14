import 'package:yourself_in_time_project/app/app.router.dart';
import 'package:yourself_in_time_project/app/app_base_view_model.dart';

class MainViewModel extends AppBaseViewModel {
  init() {
    navigationService.navigateTo(Routes.loginView);
  }

  newxtProgramming() {
    navigationService.navigateTo(Routes.programmingView);
  }
}
