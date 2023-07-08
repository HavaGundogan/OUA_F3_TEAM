// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class DarkRadialBackground extends StatelessWidget {
  final String position;
  final Color color;
  var list = List.generate(3, (index) => Color(0xFF0066DA));
  DarkRadialBackground({
    Key? key,
    required this.position,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
            gradient: RadialGradient(
                colors: [...list, this.color],
                center: (position == "bottomRight")
                    ? Alignment(1.0, 1.0)
                    : Alignment(-1.0, -1.0))),
      ),
    );
  }
}
