import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:stacked/stacked.dart';
import 'package:yourself_in_time_project/ui/splash/Splash_view_model.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashView();
}

class _SplashView extends State<SplashView> with TickerProviderStateMixin {
  late AnimationController _timeController;
  bool copAnimated = false;
  bool animatedText = false;

  @override
  void initState() {
    super.initState();
    _timeController = AnimationController(vsync: this);
    _timeController.addListener(() {
      if (_timeController.value > 0.9) {
        _timeController.stop();
        copAnimated = true;
        setState(() {});
        Future.delayed(const Duration(seconds: 1), () {
          animatedText = true;
          setState(() {});
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _timeController.dispose();
  }

//
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    return ViewModelBuilder<SplashViewModel>.reactive(
        onViewModelReady: (viewModel) => viewModel.init(),
        viewModelBuilder: () => SplashViewModel(),
        builder: (context, model, child) => Scaffold(
              backgroundColor: Colors.blue,
              body: Stack(
                children: [
                  AnimatedContainer(
                    duration: const Duration(seconds: 1),
                    height: copAnimated ? screenHeight / 2.3 : screenHeight,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            BorderRadius.circular(copAnimated ? 40.0 : 0.0)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Visibility(
                          visible: !copAnimated,
                          child: Lottie.asset("assets/json/clockcatch.json",
                              controller: _timeController,
                              onLoaded: (composition) {
                            _timeController
                              ..duration = composition.duration
                              ..forward();
                          }),
                        ),
                        Visibility(
                          visible: copAnimated,
                          child: Container(
                            padding:
                                EdgeInsets.only(left: 40, right: 40, top: 20),
                            child: Image.asset(
                              "assets/images/timeiscatch.png",
                              height: 190.0,
                              fit: BoxFit.cover,
                              width: 190.0,
                            ),
                          ),
                        ),
                        Center(
                          child: AnimatedOpacity(
                            opacity: animatedText ? 1 : 0,
                            duration: Duration(seconds: 1),
                            child: Column(
                              children: [
                                const Text(
                                  "T I M E",
                                  style: TextStyle(
                                      fontSize: 45.0, color: Colors.blue),
                                ),
                                const Text(
                                  "C A T C H",
                                  style: TextStyle(
                                      fontSize: 45.0, color: Colors.blue),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Visibility(visible: copAnimated, child: const BottomPart())
                ],
              ),
            ));
  }
}

class BottomPart extends StatelessWidget {
  const BottomPart({super.key});

  @override
  Widget build(BuildContext context) {
    SplashViewModel splashViewModel = SplashViewModel();
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Do you want to keep time in your hands ?",
              style: GoogleFonts.ubuntu(
                  fontSize: 27.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            SizedBox(
              height: 30.0,
            ),
            Text(
              'Time is a scarce resource that cannot be reversed, stored or stopped'
              'How effectively this scarce resource is used is the most important factor in determining how much people can improve themselves and their surroundings.',
              style: GoogleFonts.ubuntu(
                  fontSize: 15.0,
                  color: Colors.white.withOpacity(0.8),
                  height: 1.5),
            ),
            const SizedBox(
              height: 50,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                height: 85.0,
                width: 85.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 2.0),
                ),
                child: InkWell(
                  onTap: () {
                    splashViewModel.nextLogin();
                  },
                  child: const Icon(
                    Icons.chevron_right,
                    size: 50.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 50.0,
            )
          ],
        ),
      ),
    );
  }
}
