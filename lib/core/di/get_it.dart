import 'package:get_it/get_it.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:yourself_in_time_project/app/app_base_view_model.dart';
import 'package:yourself_in_time_project/core/services/firebase_service.dart';
import 'package:yourself_in_time_project/ui/forgotPassword/forgot_password_view_model.dart';
import 'package:yourself_in_time_project/ui/login/login_view_model.dart';
import 'package:yourself_in_time_project/ui/main/main_view_model.dart';
import 'package:yourself_in_time_project/ui/register/register_view_model.dart';
import 'package:yourself_in_time_project/ui/splash/Splash_view_model.dart';

final getIt = GetIt.instance;

void setupDi() {
  getIt.registerLazySingleton(() => AppBaseViewModel());
  getIt.registerLazySingleton(() => NavigationService());
  getIt.registerLazySingleton(() => FirebaseService());
  //UI
  getIt.registerLazySingleton(() => SplashViewModel());
  getIt.registerLazySingleton(() => FargotPasswordViewModel());
  getIt.registerLazySingleton(() => LoginViewModel());
  getIt.registerLazySingleton(() => RegisterViewModel());
  getIt.registerLazySingleton(() => MainViewModel());
}
