import 'package:flutter/material.dart';
import 'package:yourself_in_time_project/common/constants/colors_constants.dart';
import 'package:yourself_in_time_project/common/widgets/forgot_widget.dart';

class ForgotPasswordAndEmailTextFromFieldWidget extends StatelessWidget {
  const ForgotPasswordAndEmailTextFromFieldWidget({
    super.key,
    required TextEditingController emailController,
    required this.widget,
  }) : _emailController = emailController;

  final TextEditingController _emailController;
  final ForgotPasswordWidget widget;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _emailController,
      onSaved: (value) {
        widget.email = value!;
      },
      decoration: InputDecoration(
        icon: Icon(
          Icons.email,
          color: ColorConstants.loginColor,
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: ColorConstants.greyColorShade),
        ),
        labelText: "Email",
        enabledBorder: InputBorder.none,
        labelStyle: TextStyle(color: ColorConstants.greyColor),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return "Email cannot be empty!";
        } else {}
        return null;
      },
    );
  }
}
