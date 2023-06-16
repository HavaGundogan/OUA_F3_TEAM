// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:yourself_in_time_project/common/constants/colors_constants.dart';
import 'package:yourself_in_time_project/common/constants/controller_constants.dart';
import 'package:yourself_in_time_project/common/widgets/text_field_widget.dart';

class ButtonNavigateWidget extends StatelessWidget {
  final String text;
  final dynamic model;
  ButtonNavigateWidget({
    Key? key,
    required this.text,
    required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 0, 20, 30),
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
                    model.init();
                    ControllerConstants.emailController.clear();
                    ControllerConstants.passwordController.clear();
                  },
                  child: Center(
                      child: TextFieldWidget(
                    text: text,
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
