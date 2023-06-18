import 'package:flutter/material.dart';
import 'package:yourself_in_time_project/common/widgets/name_field_widget.dart';

class TextfieldConstants {
  static Widget nameTextField(
      dynamic model, TextEditingController nameController) {
    return NameTextFieldWidget(
      text: "Name",
      icon: Icons.person,
      model: model,
      nameController: nameController,
    );
  }
}
