// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:yourself_in_time_project/common/constants/colors_constants.dart';
import 'package:yourself_in_time_project/common/widgets/name_text_form_widget.dart';
import 'package:yourself_in_time_project/common/widgets/register_text_form_email_widget.dart';
import 'package:yourself_in_time_project/common/widgets/register_text_form_password_widget.dart';

import 'package:yourself_in_time_project/common/widgets/text_field_widget.dart';

class RegisterFieldWidget extends StatelessWidget {
  final dynamic model;
  const RegisterFieldWidget({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController _nameController = TextEditingController();
    TextEditingController _emailController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: ColorConstants.greyColorShade,
            borderRadius: BorderRadius.circular(10),
          ),
          margin: const EdgeInsets.fromLTRB(20, 250, 20, 10),
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 25),
          child: Column(
            children: <Widget>[
              NameTextFormFieldWidget(nameController: _nameController),
              RegisterTextFromFieldEmailWidget(
                  emailController: _emailController),
              RegisterTextFromFieldPasswordWidget(
                  passwordController: _passwordController),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(20, 0, 20, 15),
          child: Column(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                height: 40,
                child: Container(
                  child: Material(
                    borderRadius: BorderRadius.circular(20),
                    color: ColorConstants.buttonnavigateColor,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(20),
                      splashColor:
                          ColorConstants.buttonnavigateColor.withOpacity(0.4),
                      onTap: () {
                        {}
                      },
                      child: Center(
                          child: TextFieldWidget(
                        text: "SIGN UP",
                        color: ColorConstants.colorWhite,
                        fontWeight: FontWeight.w700,
                      )),
                    ),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(
                      colors: [
                        ColorConstants.lineerGradientColor,
                        ColorConstants.lineerGradientColorTwo,
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                ),
              ),
            ],
          ),
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
