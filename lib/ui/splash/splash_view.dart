import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:yourself_in_time_project/common/widgets/Animated_positioned_widget.dart';
import 'package:yourself_in_time_project/ui/splash/Splash_view_model.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return ViewModelBuilder<SplashViewModel>.reactive(
      onViewModelReady: (viewModel) => viewModel.init(),
      viewModelBuilder: () => SplashViewModel(),
      builder: (context, model, child) => Scaffold(
        backgroundColor: const Color(0xFFFFFFFF),
        body: Stack(
          children: [
            animatedPositionedSplashImage(model, height, width),
            animatedPositionedTitle(model, context),
            animatedPositionedDesc(model, width),
          ],
        ),
      ),
    );
  }
}
