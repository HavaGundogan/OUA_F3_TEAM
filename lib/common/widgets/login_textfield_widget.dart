// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:yourself_in_time_project/common/constants/colors_constants.dart';
import 'package:yourself_in_time_project/common/constants/controller_constants.dart';

class LoginTextfieldWidget extends StatelessWidget {
  final String text;
  final IconData icon;
  final dynamic model;

  LoginTextfieldWidget({
    Key? key,
    required this.text,
    required this.icon,
    required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          onChanged: (value) {
            model.setEmail(value);
          },
          validator: (value) {
            model.validateEmail(value);
            return model.emailError;
          },
          decoration: InputDecoration(
            icon: Icon(
              icon,
              color: ColorConstants.loginColor,
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: ColorConstants.greyColorShade),
            ),
            labelText: text,
            enabledBorder: InputBorder.none,
            labelStyle: TextStyle(color: ColorConstants.greyColor),
          ),
        ),
        Text(
          model.emailError,
          style: TextStyle(color: Colors.red),
        )
      ],
    );
  }
}
