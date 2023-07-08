import 'package:flutter/material.dart';

class AddSubIcon extends StatelessWidget {
  final VoidCallback? callback;
  final Color? color;
  final double? scale;

  const AddSubIcon({
    Key? key,
    this.callback,
    this.scale,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: callback,
      child: Container(
          width: 50 * (scale == null ? 1.0 : scale!),
          height: 50 * (scale == null ? 1.0 : scale!),
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: color ?? Colors.white,
              border: Border.all(width: 2, color: color ?? Colors.green)),
          child: Icon(Icons.check_circle, color: Colors.white)),
    );
  }
}
