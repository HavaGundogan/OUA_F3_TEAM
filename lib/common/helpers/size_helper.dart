import 'package:flutter/material.dart';

class SizeHelper {
  static double getSmallDiameter(BuildContext context) =>
      MediaQuery.of(context).size.width * 3 / 4;

  static double getBigDiameter(BuildContext context) =>
      MediaQuery.of(context).size.width * 7 / 8;
}
