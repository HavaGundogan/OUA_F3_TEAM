import 'package:flutter/material.dart';
import 'package:yourself_in_time_project/common/constants/colors_constants.dart';
import 'package:yourself_in_time_project/common/widgets/email_login_widget.dart';

class PasswordTextFieldWidget extends StatelessWidget {
  const PasswordTextFieldWidget({
    super.key,
    required TextEditingController passwordController,
    required this.widget,
  }) : _passwordController = passwordController;

  final TextEditingController _passwordController;
  final EmailAndPasswordWidget widget;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: _passwordController,
          onSaved: (value) {
            widget.password = value!;
          },
          decoration: InputDecoration(
            icon: Icon(
              Icons.vpn_key,
              color: ColorConstants.loginColor,
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: ColorConstants.greyColorShade),
            ),
            labelText: "Password",
            enabledBorder: InputBorder.none,
            labelStyle: TextStyle(color: ColorConstants.greyColor),
          ),
          validator: (value) {
            if (value!.isEmpty) {
              return "Password cannot be empty!";
            } else {}
          },
        ),
      ],
    );
  }
}
