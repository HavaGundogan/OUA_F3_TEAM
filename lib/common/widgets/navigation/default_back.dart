import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yourself_in_time_project/common/constants/app_colors.dart';
import 'package:yourself_in_time_project/common/widgets/profile/text_outlined_button_with_text.dart';
import 'package:yourself_in_time_project/common/widgets/shapes/rounded_border_with_icon.dart';
import 'package:yourself_in_time_project/ui/home/home_view.dart';
import 'package:yourself_in_time_project/ui/profile/edit_profile.dart';
import '../dummy/profile_dummy.dart';
import 'back_button.dart';

class DefaultNav extends StatelessWidget {
  final String title;
  final ProfileDummyType? type;
  const DefaultNav({Key? key, this.type, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      RoundedBorderWithIcon(
        onpressed: () {
          Get.to(() => HomeView());
        },
        icon: Icons.arrow_back,
      ),
      Text(this.title,
          style: GoogleFonts.lato(fontSize: 20, color: Colors.black)),
      Builder(builder: (context) {
        if (type == ProfileDummyType.Icon) {
          return ProfileDummy(
              color: HexColor.fromHex("93F0F0"),
              dummyType: ProfileDummyType.Image,
              image: "assets/images/man-head.png",
              scale: 1.2);
        } else if (type == ProfileDummyType.Image) {
          return ProfileDummy(
              color: HexColor.fromHex("9F69F9"),
              dummyType: ProfileDummyType.Icon,
              scale: 1.0);
        } else if (type == ProfileDummyType.Button) {
          return OutlinedButtonWithText(
            width: 75,
            content: "Edit",
            onPressed: () {
              Get.to(() => EditProfilePage());
            },
          );
        } else {
          return Container();
        }
      }),
    ]);
  }
}
