import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yourself_in_time_project/common/values/on_model_boarding.dart';
import 'package:yourself_in_time_project/ui/splash/Splash_view_model.dart';

class OnBoardinghPageWidget extends StatelessWidget {
  const OnBoardinghPageWidget({
    super.key,
    required this.model,
  });

  final OnBoardingModel model;

  @override
  Widget build(BuildContext context) {
    SplashViewModel splashViewModel = SplashViewModel();
    return Container(
      padding: const EdgeInsets.all(20),
      color: model.bgColor, // white
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image(
            image: AssetImage(
              model.image,
            ),
            height: model.height * 0.4,
            width: double.infinity,
          ),
          Column(
            children: [
              Text(
                model.title,
                style: GoogleFonts.ubuntu(
                    fontSize: 25, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                model.subTitle,
                style: GoogleFonts.ubuntu(
                    fontSize: 15,
                    color: Colors.grey,
                    fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          Text(
            model.counterText,
            style:
                GoogleFonts.ubuntu(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 140,
          ),
          Container(
            width: 100,
            child: Divider(
              thickness: 2,
              height: 2,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
