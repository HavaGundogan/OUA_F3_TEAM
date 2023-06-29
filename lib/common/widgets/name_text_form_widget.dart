import 'package:flutter/material.dart';
import 'package:yourself_in_time_project/common/constants/colors_constants.dart';
import 'package:yourself_in_time_project/common/widgets/register_field_widget.dart';

class NameTextFormFieldWidget extends StatelessWidget {
  const NameTextFormFieldWidget({
    super.key,
    required TextEditingController nameController,
    required this.widget,
  }) : _nameController = nameController;

  final TextEditingController _nameController;
  final RegisterFieldWidget widget;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _nameController,
      onSaved: (value) {
        widget.email = value!;
      },
      decoration: InputDecoration(
        icon: Icon(
          Icons.person,
          color: ColorConstants.loginColor,
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: ColorConstants.greyColorShade),
        ),
        labelText: "Name",
        enabledBorder: InputBorder.none,
        labelStyle: TextStyle(color: ColorConstants.greyColor),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return "Name cannot be empty!";
        } else {}
      },
    );
  }
}
