import 'package:flutter/material.dart';
import 'package:yourself_in_time_project/common/constants/colors_constants.dart';

class RegisterTextFromFieldPasswordWidget extends StatelessWidget {
  const RegisterTextFromFieldPasswordWidget({
    super.key,
    required TextEditingController passwordController,
  }) : _passwordController = passwordController;

  final TextEditingController _passwordController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _passwordController,
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
    );
  }
}
