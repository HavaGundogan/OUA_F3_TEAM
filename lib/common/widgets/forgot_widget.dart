import 'package:flutter/material.dart';
import 'package:yourself_in_time_project/common/constants/colors_constants.dart';
import 'package:yourself_in_time_project/common/constants/text_field_constants.dart';
import 'package:yourself_in_time_project/common/widgets/forgot_password_and_email.dart';

import 'package:yourself_in_time_project/common/widgets/text_create_widget.dart';
import 'package:yourself_in_time_project/common/widgets/text_field_widget.dart';
import 'package:yourself_in_time_project/core/services/auth_service.dart';
import 'package:yourself_in_time_project/ui/forgotPassword/forgot_password_view_model.dart';

Positioned buildForgotWidget(
    FargotPasswordViewModel model, BuildContext context) {
  TextEditingController _emailController = TextEditingController();
  AuthService _authService = AuthService();

  final _formKey = GlobalKey<FormState>();
  return Positioned(
    bottom: 40,
    left: 0,
    right: 0,
    top: 300,
    child: ForgotPasswordWidget(
        formKey: _formKey,
        model: model,
        emailController: _emailController,
        authService: _authService),
  );
}

class ForgotPasswordWidget extends StatefulWidget {
  late String email;
  final dynamic model;
  ForgotPasswordWidget({
    super.key,
    required this.model,
    required GlobalKey<FormState> formKey,
    required TextEditingController emailController,
    required AuthService authService,
  });

  @override
  State<ForgotPasswordWidget> createState() => _ForgotPasswordWidgetState();
}

class _ForgotPasswordWidgetState extends State<ForgotPasswordWidget> {
  final TextEditingController _emailController = TextEditingController();
  AuthService _authService = AuthService();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        margin: EdgeInsets.only(top: 10),
        child: ListView(
          children: <Widget>[
            Container(
                decoration: BoxDecoration(
                  color: ColorConstants.greyColorShade,
                  borderRadius: BorderRadius.circular(10),
                ),
                margin: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 25),
                child: ForgotPasswordAndEmailTextFromFieldWidget(
                  emailController: _emailController,
                  widget: widget,
                )),
            Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: () {
                  widget.model.init();
                },
                child: Container(
                  width: 70,
                  margin: const EdgeInsets.fromLTRB(0, 0, 20, 10),
                  child: TextCreateWidget(
                    text: "LOGIN",
                    iconData: Icons.arrow_right,
                    color: ColorConstants.loginColor,
                  ),
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.5,
              margin: EdgeInsets.only(top: 20, left: 40, right: 40),
              height: 40,
              child: Material(
                borderRadius: BorderRadius.circular(20),
                color: ColorConstants.buttonnavigateColor,
                child: InkWell(
                  borderRadius: BorderRadius.circular(20),
                  splashColor:
                      ColorConstants.buttonnavigateColor.withOpacity(0.4),
                  onTap: () {
                    {
                      forgotPassword(_authService, _emailController, context);
                    }
                  },
                  child: Center(
                      child: TextFieldWidget(
                    text: "RESET EMAİL",
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
          ],
        ),
      ),
    );
  }
}

void forgotPassword(AuthService _authService,
    TextEditingController _emailController, BuildContext context) async {
  await _authService.forgotPassword(_emailController.text, context);
}
