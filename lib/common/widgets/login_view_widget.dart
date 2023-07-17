import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yourself_in_time_project/common/constants/colors_constants.dart';
import 'package:yourself_in_time_project/common/widgets/button_navigate_continue.dart';
import 'package:yourself_in_time_project/common/widgets/email_login_widget.dart';
import 'package:yourself_in_time_project/common/widgets/text_field_widget.dart';
import 'package:yourself_in_time_project/core/services/auth_service.dart';
import 'package:yourself_in_time_project/ui/login/login_view_model.dart';

class LoginViewWidget extends StatefulWidget {
  final LoginViewModel model;
  const LoginViewWidget({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  State<LoginViewWidget> createState() => _LoginViewWidgetState();
}

class _LoginViewWidgetState extends State<LoginViewWidget> {
  bool _isloading = false;
  AuthService _authService = AuthService();

  Future<void> _signInWithGoogle() async {
    try {
      User? user = await _authService.signInWithGoogle();
      setState(() {
        _isloading = true;
      });
      if (user != null) {
        showStyledSnackBar(
            "Signed in with google", context, AnimatedSnackBarType.success);
        widget.model.init();
      } else {
        showStyledSnackBar(
            "Could not login with google", context, AnimatedSnackBarType.error);
      }
    } on Exception catch (e) {
      showStyledSnackBar(
          "Unknown error !", context, AnimatedSnackBarType.error);
      widget.model.backLogin();
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
        EmailAndPasswordWidget(
          model: widget.model,
        ),
        ButtonNavigateContinue(
          model: widget.model,
        ),
        Container(
            margin: const EdgeInsets.only(bottom: 10),
            width: double.infinity,
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 1,
                  width: 100,
                  color: Colors.black,
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  "veya",
                  style: TextStyle(
                    fontSize: 13,
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Container(
                  height: 1,
                  width: 100,
                  color: Colors.black,
                ),
              ],
            )),
        InkWell(
          splashColor: ColorConstants.buttonnavigateColor.withOpacity(0.4),
          onTap: () {
            _signInWithGoogle();
          },
          child: Container(
            margin: const EdgeInsets.only(left: 70, right: 70),
            width: MediaQuery.of(context).size.width * 0.7,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white.withOpacity(0.8),
              border: Border.all(
                color: ColorConstants.greyColor,
                width: 1.0,
              ),
            ),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/google.png",
                    width: 20,
                  ),
                  SizedBox(width: 8), // İkon ile metin arasına boşluk ekliyoruz
                  Text(
                    'Sign In with Google',
                    style: GoogleFonts.ubuntu(
                        color: ColorConstants.boxShadowColor,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextFieldWidget(
              text: "DON'T HAVE AN ACCOUNT ? ",
              fontSize: 11,
              color: ColorConstants.greyColor,
              fontWeight: FontWeight.bold,
            ),
            GestureDetector(
              onTap: () {
                widget.model.nextRegister();
              },
              child: TextFieldWidget(
                text: " SIGN UP",
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

  void showStyledSnackBar(
      String message, BuildContext context, AnimatedSnackBarType type) {
    AnimatedSnackBar.material(message,
            type: type,
            mobilePositionSettings:
                const MobilePositionSettings(topOnAppearance: 30))
        .show(context);
  }
}
