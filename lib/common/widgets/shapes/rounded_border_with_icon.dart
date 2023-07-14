import 'package:flutter/material.dart';
import 'package:yourself_in_time_project/common/constants/app_colors.dart';

class RoundedBorderWithIcon extends StatelessWidget {
  const RoundedBorderWithIcon(
      {Key? key,
      required this.icon,
      this.width,
      this.height,
      this.color = Colors.white,
      this.onpressed})
      : super(key: key);
  final IconData icon;
  final Color? color;
  final double? width;
  final double? height;
  final VoidCallback? onpressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onpressed,
      child: Container(
          width: width ?? 30,
          height: height ?? 30,
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(width: 3, color: HexColor.fromHex("31333D"))),
          child: Center(child: Icon(icon, size: 20, color: color))),
    );
  }
}
