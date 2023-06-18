import 'package:flutter/material.dart';
import 'package:yourself_in_time_project/common/constants/colors_constants.dart';
import 'package:yourself_in_time_project/common/constants/text_field_constants.dart';
import 'package:yourself_in_time_project/common/helpers/text_editing_form_field_helper.dart';
import 'package:yourself_in_time_project/common/widgets/button_navigate_widget.dart';
import 'package:yourself_in_time_project/common/widgets/text_field_widget.dart';

class RegisterFieldWidget extends StatelessWidget {
  final dynamic model;
  const RegisterFieldWidget({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: ColorConstants.greyColorShade,
            borderRadius: BorderRadius.circular(10),
          ),
          margin: const EdgeInsets.fromLTRB(20, 300, 20, 10),
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 25),
          child: Column(
            children: <Widget>[
              TextfieldConstants.nameTextField(
                  model, TextEditingControllerHelper()),
              TextfieldConstants.emailTextField(
                  model, TextEditingControllerHelper()),
              TextfieldConstants.passwordTextField(
                  model, TextEditingControllerHelper.registerPasswordController)
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        ButtonNavigateWidget(
          text: "SIGN UP",
          model: model,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextFieldWidget(
                text: "ALREADY HAVE AN ACCOUNT? ",
                fontSize: 11,
                color: ColorConstants.greyColor,
                fontWeight: FontWeight.w500),
            GestureDetector(
              onTap: () {
                model.init();
              },
              child: TextFieldWidget(
                text: " SIGN IN",
                fontSize: 11,
                color: ColorConstants.loginColor,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
