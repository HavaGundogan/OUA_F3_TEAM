import 'package:flutter/material.dart';
import 'package:yourself_in_time_project/common/helpers/size_helper.dart';
import 'package:yourself_in_time_project/common/widgets/light_blue_circle_widget.dart';

Widget getLightBlueCircle(context) {
  return Positioned(
      right: -SizeHelper.getSmallDiameter(context) / 1.5,
      bottom: -SizeHelper.getSmallDiameter(context) / 1.5,
      child: LightBlueCircleWidget());
}
