import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:yourself_in_time_project/common/widgets/login_view_widget.dart';
import 'package:yourself_in_time_project/ui/login/login_view_model.dart';

Positioned buildWidget(BuildContext context, LoginViewModel model) {
  return Positioned(
    bottom: 0,
    left: 0,
    right: 0,
    top: 0,
    child: LoginViewWidget(
      model: model,
    ),
  );
}

Positioned buildJsonAsset(Size size, String asset, double? right, double? top) {
  return Positioned(
    top: top,
    right: right,
    child: Lottie.asset(
      asset,
      height: size.height * 0.1,
      width: size.width,
      fit: BoxFit.cover,
    ),
  );
}
