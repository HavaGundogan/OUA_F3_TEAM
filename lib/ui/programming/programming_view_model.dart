import 'package:yourself_in_time_project/app/app.router.dart';
import 'package:yourself_in_time_project/app/app_base_view_model.dart';

class ProgrammingViewModel extends AppBaseViewModel {
  init() {}
  back() {
    navigationService.back();
  }

  complete() {
    navigationService.navigateTo(Routes.mainView);
  }
}
