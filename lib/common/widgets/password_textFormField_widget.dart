// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:yourself_in_time_project/common/constants/colors_constants.dart';

class PasswordTextFormField extends StatelessWidget {
  final String text;
  final IconData icon;
  final dynamic model;
  const PasswordTextFormField({
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
            model.setPassword(value);
          },
          validator: (value) {
            model.validatePassword(value);
            return model.passwordError;
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
          model.passwordError,
          style: TextStyle(color: Colors.red),
        )
      ],
    );
    ;
  }
}