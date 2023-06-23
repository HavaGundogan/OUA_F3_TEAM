import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:yourself_in_time_project/core/di/get_it.dart';
import 'package:yourself_in_time_project/core/services/auth_service.dart';
import 'package:yourself_in_time_project/ui/main/main_view_model.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    AuthService _auth = AuthService();
    return ViewModelBuilder<MainViewModel>.reactive(
        viewModelBuilder: () => getIt<MainViewModel>(),
        disposeViewModel: false,
        builder: (context, model, child) => Scaffold(
              body: Center(
                child: FloatingActionButton(
                  onPressed: () {
                    _auth.signOut();
                    model.init();
                  },
                  child: Center(child: Text("Çıkış Yap")),
                ),
              ),
            ));
  }
}
