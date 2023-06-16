// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextFieldWidget extends StatelessWidget {
  final String text;
  final double? fontSize;
  final Color? color;
  final FontWeight? fontWeight;

  TextFieldWidget({
    Key? key,
    required this.text,
    this.fontSize,
    this.color,
    this.fontWeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: GoogleFonts.ubuntu(
          fontSize: fontSize,
          color: color,
          fontWeight: fontWeight,
        ));
  }
}
