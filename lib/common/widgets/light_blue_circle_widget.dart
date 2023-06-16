import 'package:flutter/material.dart';
import 'package:yourself_in_time_project/common/constants/colors_constants.dart';
import 'package:yourself_in_time_project/common/helpers/size_helper.dart';

class LightBlueCircleWidget extends StatelessWidget {
  const LightBlueCircleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeHelper.getBigDiameter(context),
      height: SizeHelper.getBigDiameter(context),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: ColorConstants.lightBlueCircleColor,
      ),
    );
  }
}
