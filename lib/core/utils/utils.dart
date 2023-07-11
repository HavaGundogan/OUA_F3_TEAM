import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yourself_in_time_project/common/constants/app_colors.dart';
import 'package:yourself_in_time_project/common/widgets/dummy/profile_dummy.dart';
import 'package:yourself_in_time_project/common/widgets/shapes/stacked_images.dart';

class Utils {
  static final double screenWidth = Get.width;
  static final double screenHeight = Get.width;

}

class SineCurve extends Curve {
  final double count;

  SineCurve({this.count = 3});

  // t = x
  @override
  double transformInternal(double t) {
    var val = sin(count * 2 * pi * t) * 0.5 + 0.5;
    return val; //f(x)
  }
}

Widget buildStackedImages(
    {TextDirection direction = TextDirection.rtl,
    String? numberOfMembers,
    bool? addMore}) {
  final double size = 50;
  final double xShift = 20;

  Container lastContainer = Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(color: Colors.white, shape: BoxShape.circle),
      child: Center(
        child: Text(numberOfMembers!,
            style: GoogleFonts.lato(
                color: HexColor.fromHex("226AFD"),
                fontSize: 20,
                fontWeight: FontWeight.bold)),
      ));

  Container iconContainer = Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
          color: AppColors.primaryAccentColor, shape: BoxShape.circle),
      child: Icon(Icons.add, color: Colors.white));

  final items = List.generate(
      4,
      (index) => ProfileDummy(
          color: Colors.amber, // veritaanından alınacak renkler
          dummyType: ProfileDummyType.Image,
          image: "assets/images/apple.png", // Resimler Data dan alınacak
          scale: 1.0));

  return StackedWidgets(
    direction: direction,
    items: [
      ...items,
      lastContainer,
      (addMore != null) ? iconContainer : SizedBox()
    ],
    size: size,
    xShift: xShift,
  );
}
