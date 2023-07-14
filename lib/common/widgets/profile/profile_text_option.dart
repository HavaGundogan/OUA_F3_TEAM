import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yourself_in_time_project/common/constants/app_colors.dart';
import 'package:yourself_in_time_project/ui/home/home_view_model.dart';

// ignore: must_be_immutable
class ProfileTextOption extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final IconData icon;
  final double? margin;

  ProfileTextOption(
      {Key? key,
      required this.label,
      required this.icon,
      this.margin,
      this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.amber, borderRadius: BorderRadius.circular(10)),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: this.margin ?? 10.0), // 8.0 as default margin.
              child: ListTile(
                  title: Row(
                    children: [
                      Icon(icon, color: Colors.white, size: 27),
                      Text(label,
                          style: GoogleFonts.lato(
                              fontSize: 18, color: Colors.white)),
                    ],
                  ),
                  trailing: SizedBox()),
            ),
            Divider(height: 1, color: HexColor.fromHex("353742"))
            // Divider(height: 1, color: HexColor.fromHex("616575"))
          ],
        ),
      ),
    );
  }
}
