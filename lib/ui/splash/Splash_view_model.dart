import 'package:get/get.dart';
import 'package:yourself_in_time_project/app/app.router.dart';
import 'package:yourself_in_time_project/app/app_base_view_model.dart';
import 'package:yourself_in_time_project/ui/splash/splashView.dart';

class SplashViewModel extends AppBaseViewModel {
  nextLogin() {
    Get.to(() => OnBoardingScreen());
  }
}
