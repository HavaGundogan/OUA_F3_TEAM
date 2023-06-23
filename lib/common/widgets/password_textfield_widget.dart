import 'package:flutter/material.dart';
import 'package:yourself_in_time_project/common/constants/colors_constants.dart';
import 'package:yourself_in_time_project/common/widgets/email_login_widget.dart';

class PasswordTextFieldWidget extends StatefulWidget {
  const PasswordTextFieldWidget({
    Key? key,
    required TextEditingController passwordController,
    required this.widget,
  })  : _passwordController = passwordController,
        super(key: key);

  final TextEditingController _passwordController;
  final EmailAndPasswordWidget widget;

  @override
  _PasswordTextFieldWidgetState createState() =>
      _PasswordTextFieldWidgetState();
}

class _PasswordTextFieldWidgetState extends State<PasswordTextFieldWidget> {
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: !_isPasswordVisible,
      controller: widget._passwordController,
      onSaved: (value) {
        widget.widget.password = value!;
      },
      decoration: InputDecoration(
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              _isPasswordVisible = !_isPasswordVisible;
            });
          },
          icon: Icon(
            _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
            color: ColorConstants.greyColor,
          ),
        ),
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
      validator: (value) {
        if (value!.isEmpty) {
          return "Password cannot be empty!";
        }
      },
    );
  }
}
