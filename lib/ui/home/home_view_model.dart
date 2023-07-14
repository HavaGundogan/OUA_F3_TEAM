import 'package:yourself_in_time_project/app/app.router.dart';
import 'package:yourself_in_time_project/app/app_base_view_model.dart';

class HomeViewModel extends AppBaseViewModel {
  init() {}
  nextView() {
    navigationService.navigateTo(Routes.mainView);
  }

  programNextView() {
    navigationService.navigateTo(Routes.programmingView);
  }
}
