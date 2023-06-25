// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:yourself_in_time_project/common/constants/colors_constants.dart';
import 'package:yourself_in_time_project/common/widgets/name_text_form_widget.dart';
import 'package:yourself_in_time_project/common/widgets/register_text_form_email_widget.dart';
import 'package:yourself_in_time_project/common/widgets/register_text_form_password_widget.dart';

import 'package:yourself_in_time_project/common/widgets/text_field_widget.dart';
import 'package:yourself_in_time_project/core/services/auth_service.dart';

class RegisterFieldWidget extends StatefulWidget {
  final dynamic model;
  late String name, email, password;
  RegisterFieldWidget({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  State<RegisterFieldWidget> createState() => _RegisterFieldWidgetState();
}

class _RegisterFieldWidgetState extends State<RegisterFieldWidget> {
  AuthService _authService = AuthService();
  final _formKey = GlobalKey<FormState>();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
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
                NameTextFormFieldWidget(
                  nameController: _nameController,
                  widget: widget,
                ),
                RegisterTextFromFieldEmailWidget(
                  emailController: _emailController,
                  widget: widget,
                ),
                RegisterTextFromFieldPasswordWidget(
                  passwordController: _passwordController,
                  widget: widget,
                ),
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
                          {
                            registerSing();
                          }
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
                  widget.model.init();
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
      ),
    );
  }

  void registerSing() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      await _authService.createPerson(_nameController.text,
          _emailController.text, _passwordController.text, context);
    }
  }
}
