import 'package:flutter/material.dart';

import 'package:yourself_in_time_project/common/widgets/login_textfield_widget.dart';
import 'package:yourself_in_time_project/common/widgets/password_textFormField_widget.dart';

class TextfieldConstants {
  static Widget emailTextField(dynamic model) {
    return LoginTextfieldWidget(
      text: "Email",
      icon: Icons.email,
      model: model,
    );
  }

  static Widget passwordTextField(dynamic model) {
    return PasswordTextFormField(
      text: "Password",
      icon: Icons.vpn_key,
      model: model,
    );
  }

  static Widget nameTextField(dynamic model) {
    return LoginTextfieldWidget(
      text: "Name",
      icon: Icons.person,
      model: model,
    );
  }
}
