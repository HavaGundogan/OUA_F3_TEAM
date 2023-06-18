// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:yourself_in_time_project/common/constants/colors_constants.dart';
import 'package:yourself_in_time_project/common/constants/controller_constants.dart';
import 'package:yourself_in_time_project/common/constants/text_field_constants.dart';
import 'package:yourself_in_time_project/common/helpers/text_editing_form_field_helper.dart';
import 'package:yourself_in_time_project/common/widgets/login_textfield_widget.dart';
import 'package:yourself_in_time_project/common/widgets/text_field_widget.dart';

class ButtonNavigateWidget extends StatefulWidget {
  final String text;
  final dynamic model;

  ButtonNavigateWidget({
    Key? key,
    required this.text,
    required this.model,
  }) : super(key: key);

  @override
  State<ButtonNavigateWidget> createState() => _ButtonNavigateWidgetState();
}

class _ButtonNavigateWidgetState extends State<ButtonNavigateWidget> {
  TextEditingControllerHelper controllerHelper = TextEditingControllerHelper();
  @override
  void dispose() {
    controllerHelper.emailController;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    void showErrorMessage(String errorMessage) {
      // Silineck
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Hata'),
            content: Text(errorMessage),
            actions: [
              TextButton(
                child: Text('Tamam'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }

    return Container(
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
                    var email = TextfieldConstants.textFormField(widget.model);

                    var password = ControllerConstants.passwordController.text;
                    widget.model
                        .signInWithEmailAndPassword(email, password)
                        .catchError((error) {
                      showErrorMessage(error.toString());
                    });
                    print("email $email");
                  },
                  child: Center(
                      child: TextFieldWidget(
                    text: widget.text,
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
    );
  }
}
