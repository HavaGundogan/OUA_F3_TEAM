// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:yourself_in_time_project/common/constants/colors_constants.dart';

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
          margin: const EdgeInsets.fromLTRB(20, 300, 20, 10),
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 25),
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  icon: Icon(
                    Icons.email,
                    color: ColorConstants.loginColor,
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: ColorConstants.greyColorShade),
                  ),
                  labelText: "Email",
                  enabledBorder: InputBorder.none,
                  labelStyle: TextStyle(color: ColorConstants.greyColor),
                ),
              ),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  icon: Icon(
                    Icons.email,
                    color: ColorConstants.loginColor,
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: ColorConstants.greyColorShade),
                  ),
                  labelText: "Email",
                  enabledBorder: InputBorder.none,
                  labelStyle: TextStyle(color: ColorConstants.greyColor),
                ),
              ),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(
                  icon: Icon(
                    Icons.email,
                    color: ColorConstants.loginColor,
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: ColorConstants.greyColorShade),
                  ),
                  labelText: "Email",
                  enabledBorder: InputBorder.none,
                  labelStyle: TextStyle(color: ColorConstants.greyColor),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
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
