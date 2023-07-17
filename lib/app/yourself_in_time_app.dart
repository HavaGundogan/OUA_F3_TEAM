import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:yourself_in_time_project/app/app.router.dart';
import 'package:yourself_in_time_project/app/app_base_view_model.dart';
import 'package:yourself_in_time_project/core/di/get_it.dart';
import 'package:yourself_in_time_project/ui/home/home_view.dart';
import 'package:yourself_in_time_project/ui/messages/messages.dart';
import 'package:yourself_in_time_project/ui/splash/splashView.dart';
import 'package:yourself_in_time_project/ui/splash/splash_view.dart';

class YourselfInTimeApp extends StatelessWidget {
  const YourselfInTimeApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        <DeviceOrientation>[DeviceOrientation.portraitUp]);
    return ViewModelBuilder<AppBaseViewModel>.reactive(
      viewModelBuilder: () => getIt<AppBaseViewModel>(),
      builder: (context, viewModel, child) => MaterialApp(
          navigatorKey: StackedService.navigatorKey,
          theme: ThemeData(
            brightness: Brightness.light,
            appBarTheme: AppBarTheme(
              systemOverlayStyle: SystemUiOverlayStyle.light,
            ),
          ),
          onGenerateRoute: StackedRouter().onGenerateRoute,
          navigatorObservers: [StackedService.routeObserver],
          title: "Yourself In Time App",
          debugShowCheckedModeBanner: false,
          home: SplashView()),
    );
  }
}
