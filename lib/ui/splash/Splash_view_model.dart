import 'package:flutter/material.dart';
import 'package:yourself_in_time_project/app/app.router.dart';
import 'package:yourself_in_time_project/app/app_base_view_model.dart';

class SplashViewModel extends AppBaseViewModel {
  bool _animate = false;
  bool get animate => _animate;

  void init() {
    startAnimation();
  }

  Future<void> startAnimation() async {
    await Future.delayed(Duration(milliseconds: 500));
    _animate = true;
    notifyListeners();
    await Future.delayed(
      Duration(milliseconds: 5000),
    );
    navigationService.navigateTo(
      Routes.loginView,
      transition: (context, animation, secondaryAnimation, child) {
        return SlideTransition(
          position:
              Tween<Offset>(begin: const Offset(1.0, 0.0), end: Offset.zero)
                  .animate(animation),
          child: child,
        );
      },
    );
  }
}
