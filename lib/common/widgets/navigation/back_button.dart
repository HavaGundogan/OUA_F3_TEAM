import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yourself_in_time_project/common/widgets/shapes/rounded_border_with_icon.dart';
import 'package:yourself_in_time_project/ui/login/login_view.dart';

class AppBackButton extends StatelessWidget {
  const AppBackButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RoundedBorderWithIcon(
      icon: Icons.arrow_back,
      onpressed: () {
        Get.back();
      },
    );
  }
}
