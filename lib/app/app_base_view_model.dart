import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:yourself_in_time_project/core/di/get_it.dart';
import 'package:yourself_in_time_project/core/services/firebase_service.dart';

class AppBaseViewModel extends BaseViewModel {
  NavigationService navigationService = getIt<NavigationService>();
  final FirebaseService firebaseService = getIt<FirebaseService>();
  StreamSubscription<ConnectivityResult>? subcription;
  init() {
    listenConnectivity();
    firebaseService.init();
  }

  checkConnectivity() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
    } else if (connectivityResult == ConnectivityResult.wifi) {}
  }

  listenConnectivity() {
    subcription = Connectivity().onConnectivityChanged.listen((result) {
      if (result != ConnectivityResult.wifi ||
          result != ConnectivityResult.mobile) {
        print("Device has no conncetion");
      }
    });
  }
}
