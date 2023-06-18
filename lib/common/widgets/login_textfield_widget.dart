// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:yourself_in_time_project/common/constants/colors_constants.dart';
import 'package:yourself_in_time_project/common/helpers/text_editing_form_field_helper.dart';

class LoginTextfieldWidget extends StatefulWidget {
  static final GlobalKey<_LoginTextfieldWidgetState> myWidgetKey =
      GlobalKey<_LoginTextfieldWidgetState>();
  final String text;
  final IconData icon;
  final dynamic model;

  LoginTextfieldWidget({
    Key? key,
    required this.text,
    required this.icon,
    this.model,
  }) : super(key: key);

  @override
  State<LoginTextfieldWidget> createState() => _LoginTextfieldWidgetState();
}

class _LoginTextfieldWidgetState extends State<LoginTextfieldWidget> {
  TextEditingController emailController = TextEditingController();
  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  String getFormFieldText() {
    return emailController.text;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: emailController,
          decoration: InputDecoration(
            icon: Icon(
              widget.icon,
              color: ColorConstants.loginColor,
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: ColorConstants.greyColorShade),
            ),
            labelText: widget.text,
            enabledBorder: InputBorder.none,
            labelStyle: TextStyle(color: ColorConstants.greyColor),
          ),
        ),
        Text(
          widget.model.emailError,
          style: TextStyle(color: Colors.red),
        )
      ],
    );
  }
}
