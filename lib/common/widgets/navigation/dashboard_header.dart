// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yourself_in_time_project/common/constants/app_colors.dart';
import 'package:yourself_in_time_project/common/constants/colors_constants.dart';
import 'package:yourself_in_time_project/common/values/styles.dart';
import 'package:yourself_in_time_project/common/widgets/dummy/profile_dummy.dart';

class DashBoardNav extends StatelessWidget {
  final String title;
  final String image;
  final IconData icon;
  final StatelessWidget? page;
  final VoidCallback onImageTapped;

  DashBoardNav(
      {Key? key,
      required this.title,
      required this.image,
      required this.icon,
      this.page,
      required this.onImageTapped,
      required MaterialColor iconColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          this.title,
          style: AppTextStyles.header2,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            InkWell(
              onTap: () {
                if (page != null) Get.to(() => page!);
              },
              child: Stack(children: <Widget>[
                Icon(icon, color: Color(0xFF0066DA), size: 30),
                Positioned(
                    // draw a red marble
                    top: 0.0,
                    right: 0.0,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.green),
                      alignment: Alignment.center,
                    ))
              ]),
            ),
            SizedBox(
              width: 40,
            ),
            InkWell(
              onTap: onImageTapped,
              child: ProfileDummy(
                  color: HexColor.fromHex("93f0f0"),
                  dummyType: ProfileDummyType.Image,
                  image: this.image,
                  scale: 1.2),
            ),
          ],
        )
      ],
    );
  }
}
