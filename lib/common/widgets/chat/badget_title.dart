import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yourself_in_time_project/common/values/spacing.dart';

class BadgedTitle extends StatelessWidget {
  final String title;
  final String number;
  final String color;
  const BadgedTitle(
      {Key? key,
      required this.title,
      required this.number,
      required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Text(title,
          style: GoogleFonts.lato(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600)),
      AppSpaces.horizontalSpace10,
      Container(
          padding: EdgeInsets.symmetric(horizontal: 25, vertical: 8.0),
          decoration: BoxDecoration(
              //color: HexColor.fromHex(color),
              border: Border.all(color: Colors.amber, width: 1),
              borderRadius: BorderRadius.circular(50.0)),
          child: Text("$number members",
              style: GoogleFonts.lato(
                  color: Colors.blue,
                  fontWeight: FontWeight.w500,
                  fontSize: 12)))
    ]);
  }
}
