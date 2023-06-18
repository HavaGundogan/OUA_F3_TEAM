import 'package:flutter/material.dart';
import 'package:yourself_in_time_project/common/constants/colors_constants.dart';
import 'package:yourself_in_time_project/common/widgets/text_field_widget.dart';

class ButtonNavigateContinue extends StatelessWidget {
  final dynamic model;
  const ButtonNavigateContinue({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        model.nextForgot();
      },
      child: Container(
        margin: const EdgeInsets.fromLTRB(20, 0, 20, 10),
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.5,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: ColorConstants.buttonnavigateColor,
                border: Border.all(
                  color: ColorConstants.greyColor,
                  width: 1.0,
                ),
              ),
              child: Center(
                  child: TextFieldWidget(
                text: "Continue as Guest",
                color: ColorConstants.greyColor,
                fontWeight: FontWeight.w800,
              )),
            ),
          ],
        ),
      ),
    );
  }
}
