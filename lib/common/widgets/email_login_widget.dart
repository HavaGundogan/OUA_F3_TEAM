// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:yourself_in_time_project/common/constants/colors_constants.dart';
import 'package:yourself_in_time_project/common/constants/text_field_constants.dart';
import 'package:yourself_in_time_project/common/widgets/text_create_widget.dart';
import 'package:yourself_in_time_project/common/widgets/text_field_widget.dart';
import 'package:yourself_in_time_project/core/services/auth_service.dart';

class EmailAndPasswordWidget extends StatefulWidget {
  final dynamic model;

  EmailAndPasswordWidget({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  State<EmailAndPasswordWidget> createState() => _EmailAndPasswordWidgetState();
}

class _EmailAndPasswordWidgetState extends State<EmailAndPasswordWidget> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  AuthService _authService = AuthService();
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
              Column(
                children: [
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
                ],
              ),
              Column(
                children: [
                  TextFormField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.vpn_key,
                        color: ColorConstants.loginColor,
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: ColorConstants.greyColorShade),
                      ),
                      labelText: "Password",
                      enabledBorder: InputBorder.none,
                      labelStyle: TextStyle(color: ColorConstants.greyColor),
                    ),
                  ),
                ],
              )
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
                        {
                          _authService
                              .signIn(_emailController.text,
                                  _passwordController.text)
                              .then((value) {
                            return widget.model.init();
                          });
                          print("email:${_emailController.text}");
                        }
                      },
                      child: Center(
                          child: TextFieldWidget(
                        text: "widget.text",
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
        )
      ],
    );
  }
}
