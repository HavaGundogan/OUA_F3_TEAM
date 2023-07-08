import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yourself_in_time_project/common/widgets/shapes/rounded_border_with_icon.dart';

class AppBackButton extends StatelessWidget {
  const AppBackButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.back();
      },
      child: RoundedBorderWithIcon(icon: Icons.arrow_back),
    );
  }
}
