import 'package:flutter/material.dart';

class TextEditingControllerHelper {
  final TextEditingController _emailController = TextEditingController();
  TextEditingController get emailController => _emailController;

  static final TextEditingController nameController = TextEditingController();

  static final TextEditingController passwordController =
      TextEditingController();

  static final TextEditingController registerEmailController =
      TextEditingController();

  final TextEditingController _registerNameController = TextEditingController();
  get registerNameController => _registerNameController;
  static final TextEditingController registerPasswordController =
      TextEditingController();

  final TextEditingController _forgotEmailController = TextEditingController();
  get forgotEmailController => _forgotEmailController;
}
