// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:yourself_in_time_project/common/constants/colors_constants.dart';
import 'package:yourself_in_time_project/common/constants/text_field_constants.dart';
import 'package:yourself_in_time_project/common/helpers/text_editing_form_field_helper.dart';
import 'package:yourself_in_time_project/common/widgets/button_navigate_widget.dart';
import 'package:yourself_in_time_project/common/widgets/text_create_widget.dart';

class EmailAndPasswordWidget extends StatefulWidget {
  final dynamic model;
  final TextEditingControllerHelper controller;
  EmailAndPasswordWidget({
    Key? key,
    required this.model,
    required this.controller,
  }) : super(key: key);

  @override
  State<EmailAndPasswordWidget> createState() => _EmailAndPasswordWidgetState();
}

class _EmailAndPasswordWidgetState extends State<EmailAndPasswordWidget> {
  @override
  void dispose() {
    widget.controller.emailController.dispose();

    super.dispose();
  }

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
              TextfieldConstants.emailTextField(
                  widget.model, TextEditingControllerHelper()),
              TextfieldConstants.passwordTextField(
                  widget.model, TextEditingControllerHelper.passwordController)
            ],
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: GestureDetector(
            onTap: () {
              widget.model.nextForgot();
            },
            child: Container(
                width: 130,
                margin: const EdgeInsets.fromLTRB(0, 0, 20, 10),
                child: TextCreateWidget(
                    text: "FORGOT PASSWORD",
                    iconData: Icons.arrow_right,
                    color: ColorConstants.loginColor)),
          ),
        ),
        ButtonNavigateWidget(
          text: "SIGN IN",
          model: widget.model,
        ),
      ],
    );
  }
}
