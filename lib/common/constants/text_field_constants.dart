import 'package:flutter/material.dart';
import 'package:yourself_in_time_project/common/helpers/text_editing_form_field_helper.dart';

import 'package:yourself_in_time_project/common/widgets/login_textfield_widget.dart';
import 'package:yourself_in_time_project/common/widgets/password_textFormField_widget.dart';

class TextfieldConstants {
  static Widget emailTextField(
      dynamic model, TextEditingControllerHelper controllerHelper) {
    return LoginTextfieldWidget(
      text: "Email",
      icon: Icons.email,
      model: model,
    );
  }

  static Widget passwordTextField(
      dynamic model, TextEditingController controllerHelper) {
    return PasswordTextFormField(
      text: "Password",
      icon: Icons.vpn_key,
      model: model,
      controller: controllerHelper,
    );
  }

  static Widget nameTextField(
      dynamic model, TextEditingControllerHelper controllerHelper) {
    return LoginTextfieldWidget(
      text: "Name",
      icon: Icons.person,
      model: model,
    );
  }

  static String textFormField(
    dynamic model,
  ) {
    LoginTextfieldWidget loginTextfieldWidget = LoginTextfieldWidget(
      text: "Name",
      icon: Icons.person,
      model: model,
    );
    return LoginTextfieldWidget.myWidgetKey.currentState!.getFormFieldText();
  }
}
