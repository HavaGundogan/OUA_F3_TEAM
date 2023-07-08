import 'package:flutter/material.dart';
import 'package:yourself_in_time_project/common/constants/app_colors.dart';

class ButtonStyles {
  static final ButtonStyle blueRounded = ButtonStyle(
      backgroundColor:
          MaterialStateProperty.all<Color>(HexColor.fromHex("246CFE")),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50.0),
              side: BorderSide(color: HexColor.fromHex("246CFE")))));

  static final ButtonStyle imageRounded = ButtonStyle(
      backgroundColor: MaterialStateProperty.all(HexColor.fromHex("181A1F")),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50.0),
              side: BorderSide(color: HexColor.fromHex("666A7A"), width: 1))));
}
