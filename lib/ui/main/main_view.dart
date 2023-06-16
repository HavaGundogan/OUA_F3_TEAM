import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:yourself_in_time_project/core/di/get_it.dart';
import 'package:yourself_in_time_project/ui/main/main_view_model.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MainViewModel>.reactive(
        viewModelBuilder: () => getIt<MainViewModel>(),
        disposeViewModel: false,
        builder: (context, model, child) => Scaffold());
  }
}
