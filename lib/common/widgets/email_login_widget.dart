import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:yourself_in_time_project/common/constants/colors_constants.dart';
import 'package:yourself_in_time_project/common/widgets/email_texformfild_widget.dart';
import 'package:yourself_in_time_project/common/widgets/password_textfield_widget.dart';
import 'package:yourself_in_time_project/common/widgets/text_create_widget.dart';
import 'package:yourself_in_time_project/common/widgets/text_field_widget.dart';
import 'package:yourself_in_time_project/core/services/auth_service.dart';

class EmailAndPasswordWidget extends StatefulWidget {
  final dynamic model;
  late String email, password;
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

  final _formKey = GlobalKey<FormState>();

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
            margin: const EdgeInsets.fromLTRB(20, 300, 20, 10),
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 25),
            child: Column(
              children: <Widget>[
                EmailTextFormfieldWidget(
                    emailController: _emailController, widget: widget),
                PasswordTextFieldWidget(
                    passwordController: _passwordController, widget: widget)
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
                  margin: const EdgeInsets.fromLTRB(0, 0, 10, 10),
                  child: TextCreateWidget(
                      text: "Forgot Password",
                      iconData: Icons.question_mark,
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
                            signIn();
                          }
                        },
                        child: Center(
                            child: TextFieldWidget(
                          text: "SIGN IN",
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
      ),
    );
  }

  void signIn() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      await _authService.signIn(
          widget.email, widget.password, widget.model, context);
    }
  }
}
