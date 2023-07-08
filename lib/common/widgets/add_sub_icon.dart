import 'package:flutter/material.dart';

class AddSubIcon extends StatelessWidget {
  final Function()? ontap;
  final Color? color;
  final double? scale;

  const AddSubIcon({
    Key? key,
    this.ontap,
    this.scale,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
          width: 50 * (scale == null ? 2.0 : scale!),
          height: 50 * (scale == null ? 2.0 : scale!),
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: color ?? Colors.white,
              border: Border.all(width: 2, color: color ?? Colors.green)),
          child: Icon(Icons.check_circle, color: Colors.white)),
    );
  }
}
