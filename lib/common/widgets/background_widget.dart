import 'package:flutter/material.dart';
import 'package:yourself_in_time_project/common/constants/colors_constants.dart';

class BackgroundWidget extends StatelessWidget {
  BackgroundWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Positioned(
        bottom: 0,
        left: 0,
        right: 0,
        top: 300,
        child: Container(
            width: size.width,
            decoration: BoxDecoration(
              color: ColorConstants.bacgroundWidgetColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
              boxShadow: [
                BoxShadow(
                  color: ColorConstants.boxShadowColor,
                  blurRadius: 5,
                  offset: Offset(0, 2.0),
                ),
              ],
            ),
            child: null));
  }
}
