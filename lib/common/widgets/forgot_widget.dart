import 'package:flutter/material.dart';
import 'package:yourself_in_time_project/common/constants/colors_constants.dart';
import 'package:yourself_in_time_project/common/constants/text_field_constants.dart';
import 'package:yourself_in_time_project/common/helpers/text_editing_form_field_helper.dart';
import 'package:yourself_in_time_project/common/widgets/button_navigate_widget.dart';
import 'package:yourself_in_time_project/common/widgets/text_create_widget.dart';
import 'package:yourself_in_time_project/ui/forgotPassword/forgot_password_view_model.dart';

Positioned buildForgotWidget(FargotPasswordViewModel model) {
  final TextEditingControllerHelper controllerHelper;
  return Positioned(
    bottom: 40,
    left: 0,
    right: 0,
    top: 360,
    child: Container(
      width: double.infinity,
      height: 200,
      child: ListView(
        physics: NeverScrollableScrollPhysics(),
        children: <Widget>[
          Container(
              decoration: BoxDecoration(
                color: ColorConstants.greyColorShade,
                borderRadius: BorderRadius.circular(10),
              ),
              margin: const EdgeInsets.fromLTRB(20, 0, 20, 10),
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 25),
              child: TextfieldConstants.emailTextField(
                  model, TextEditingControllerHelper())),
          Align(
            alignment: Alignment.centerRight,
            child: GestureDetector(
              onTap: () {
                model.init();
              },
              child: Container(
                width: 70,
                margin: const EdgeInsets.fromLTRB(0, 0, 20, 10),
                child: TextCreateWidget(
                  text: "LOGIN",
                  iconData: Icons.arrow_right,
                  color: ColorConstants.loginColor,
                ),
              ),
            ),
          ),
          ButtonNavigateWidget(
            text: "SEND",
            model: model,
          ),
        ],
      ),
    ),
  );
}
