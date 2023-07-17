import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:yourself_in_time_project/common/values/on_model_boarding.dart';
import 'package:yourself_in_time_project/ui/login/login_view.dart';
import 'package:yourself_in_time_project/ui/splash/Splash_view_model.dart';
import 'package:yourself_in_time_project/ui/splash/on_boarding_page_widget.dart';
import 'package:yourself_in_time_project/ui/splash/on_boardingg.dart';
import 'package:yourself_in_time_project/ui/splash/splash_view.dart';

class OnBoardingScreen extends StatefulWidget {
  OnBoardingScreen({
    super.key,
  });

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final controller = LiquidController();

  int currectPage = 0;

  @override
  Widget build(BuildContext context) {
    SplashViewModel splashViewModel = SplashViewModel();
    final size = MediaQuery.of(context).size;
    final pagess = [
      OnBoardingPageWidget(
        model: OnBoardingModel(
            "assets/images/tool.png",
            "Build Awesome Apps",
            "Don’t struggle to remember, take notes. Let TIME CATCH remind you",
            "1/2",
            Colors.white,
            size.height),
      ),
      OnBoardinghPageWidget(
        model: OnBoardingModel(
            "assets/images/page.png",
            "Learn",
            "Learn to catch your time because time is our most valuable treasure !",
            "2/2",
            Colors.white,
            size.height),
      ),
    ];

    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          LiquidSwipe(
            onPageChangeCallback: OnPageChangedCallBack,
            liquidController: controller,
            pages: pagess,
            slideIconWidget: Icon(Icons.arrow_back_ios),
            enableSideReveal: true,
          ),
          Positioned(
              bottom: 100,
              child: OutlinedButton(
                onPressed: () {
                  int nextPage = controller.currentPage + 1;
                  controller.animateToPage(page: nextPage);
                  if (controller.currentPage == 1) {
                    Get.to(() => LoginView());
                  }
                },
                style: ElevatedButton.styleFrom(
                    side: const BorderSide(color: Colors.black26),
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(20),
                    onPrimary: Colors.white),
                child: Container(
                  padding: const EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                      color: Colors.black, shape: BoxShape.circle),
                  child: Icon(Icons.arrow_forward_ios),
                ),
              )),
          Positioned(
              top: 50,
              right: 20,
              child: TextButton(
                  onPressed: () => controller.jumpToPage(page: 1),
                  child: Text(
                    "Skip",
                    style: TextStyle(color: Colors.grey),
                  ))),
          Positioned(
              bottom: 70,
              child: AnimatedSmoothIndicator(
                activeIndex: controller.currentPage,
                effect: const WormEffect(
                    activeDotColor: Color(0xff272727), dotHeight: 5.0),
                count: 2,
              ))
        ],
      ),
    );
  }

  OnPageChangedCallBack(int activeIndex) {
    setState(() {
      currectPage = activeIndex;
    });
  }
}
