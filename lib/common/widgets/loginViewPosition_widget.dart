import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:yourself_in_time_project/common/constants/colors_constants.dart';
import 'package:yourself_in_time_project/common/widgets/button_navigate_continue.dart';
import 'package:yourself_in_time_project/common/widgets/email_login_widget.dart';
import 'package:yourself_in_time_project/common/widgets/text_field_widget.dart';
import 'package:yourself_in_time_project/ui/login/login_view_model.dart';

Positioned buildWidget(BuildContext context, LoginViewModel model) {
  return Positioned(
    bottom: 0,
    left: 0,
    right: 0,
    top: 0,
    child: ListView(
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
        Column(
          children: [
            EmailAndPasswordWidget(
              model: model,
            ),
            ButtonNavigateContinue(
              model: model,
            ),
          ],
        ),
        const SizedBox(
          height: 40,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextFieldWidget(
              text: "DON'T HAVE AN ACCOUNT ? ",
              fontSize: 11,
              color: ColorConstants.greyColor,
              fontWeight: FontWeight.bold,
            ),
            GestureDetector(
              onTap: () {
                model.nextRegister();
              },
              child: TextFieldWidget(
                text: " SIGN UP",
                fontSize: 11,
                color: ColorConstants.loginColor,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ],
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
