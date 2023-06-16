import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yourself_in_time_project/ui/splash/Splash_view_model.dart';

AnimatedPositioned animatedPositionedDesc(SplashViewModel model, double width) {
  return AnimatedPositioned(
    duration: const Duration(milliseconds: 1600),
    bottom: model.animate ? 40 : 0,
    left: model.animate ? 20 : width,
    child: AnimatedOpacity(
      duration: const Duration(milliseconds: 1600),
      opacity: model.animate ? 1 : 0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Gününüzü Planlamanın",
            style: GoogleFonts.ubuntu(fontSize: 35),
            softWrap: true,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            "En Kısa Yolu...",
            style: GoogleFonts.ubuntu(fontSize: 35),
            softWrap: true,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    ),
  );
}

AnimatedPositioned animatedPositionedTitle(
    SplashViewModel model, BuildContext context) {
  return AnimatedPositioned(
    duration: const Duration(milliseconds: 1600),
    top: 50,
    left: model.animate ? 20 : -80,
    child: Text(
      "TIME CATCH",
      style: GoogleFonts.ubuntu(fontSize: 40, fontWeight: FontWeight.w800),
    ),
  );
}

AnimatedPositioned animatedPositionedSplashImage(
    SplashViewModel model, double height, double width) {
  return AnimatedPositioned(
    duration: const Duration(milliseconds: 1600),
    bottom: model.animate ? -50 : -30,
    left: model.animate ? 0 : -30,
    child: Container(
      height: height + 80,
      width: width,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/splash.png"),
          fit: BoxFit.cover,
        ),
      ),
    ),
  );
}
