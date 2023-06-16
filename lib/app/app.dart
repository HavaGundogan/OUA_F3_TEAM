import 'package:stacked/stacked_annotations.dart';
import 'package:yourself_in_time_project/ui/forgotPassword/forgot_password_view.dart';
import 'package:yourself_in_time_project/ui/login/login_view.dart';
import 'package:yourself_in_time_project/ui/main/main_view.dart';
import 'package:yourself_in_time_project/ui/messages/messages_view.dart';
import 'package:yourself_in_time_project/ui/programming/programmin_view.dart';
import 'package:yourself_in_time_project/ui/register/register_view.dart';
import 'package:yourself_in_time_project/ui/splash/splash_view.dart';

@StackedApp(routes: [
  MaterialRoute(page: SplashView, initial: true),
  MaterialRoute(page: LoginView),
  MaterialRoute(page: MainView),
  MaterialRoute(page: MessagesView),
  MaterialRoute(page: ProgrammingView),
  MaterialRoute(page: RegisterView),
  MaterialRoute(page: ForgotPasswordView)
])
class App {}
