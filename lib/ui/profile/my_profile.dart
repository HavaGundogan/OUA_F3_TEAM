import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yourself_in_time_project/common/constants/app_colors.dart';
import 'package:yourself_in_time_project/common/values/spacing.dart';
import 'package:yourself_in_time_project/common/widgets/Navigation/default_back.dart';
import 'package:yourself_in_time_project/common/widgets/Profile/profile_text_option.dart';
import 'package:yourself_in_time_project/common/widgets/darkBackground/dark_radial_background.dart';
import 'package:yourself_in_time_project/common/widgets/dummy/profile_dummy.dart';
import 'package:yourself_in_time_project/common/widgets/profile/text_outlined_button_with_text.dart';
import 'package:yourself_in_time_project/ui/profile/edit_profile.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final ValueNotifier<bool> totalTaskNotifier = ValueNotifier(true);
  final String tabSpace = "\t\t";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      DarkRadialBackground(
        color: Colors.white,
        position: "topLeft",
      ),
      Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                DefaultNav(
                    title: "$tabSpace Profile", type: ProfileDummyType.Button),
                SizedBox(height: 30),
                ProfileDummy(
                    color: HexColor.fromHex("94F0F1"),
                    dummyType: ProfileDummyType.Image,
                    scale: 4.0,
                    image: "assets/images/man-head.png"),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Ahmet Aslan",
                      style: GoogleFonts.lato(
                          color: Colors.black,
                          fontSize: 40,
                          fontWeight: FontWeight.bold)),
                ),
                Text("ahmet@email.com",
                    style: GoogleFonts.lato(color: Colors.blue, fontSize: 17)),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: OutlinedButtonWithText(
                      width: 75,
                      content: "Edit",
                      onPressed: () {
                        Get.to(() => EditProfilePage());
                      }),
                ),
                AppSpaces.verticalSpace20,
                Column(
                  children: [
                    AppSpaces.verticalSpace10,
                    ProfileTextOption(
                      label: '$tabSpace Favorites',
                      icon: Icons.favorite,
                      margin: 5.0,
                    ),
                    AppSpaces.verticalSpace10,
                    ProfileTextOption(
                      label: '$tabSpace Share Profile',
                      icon: FeatherIcons.share2,
                      margin: 5.0,
                    ),
                    AppSpaces.verticalSpace10,
                    ProfileTextOption(
                      label: '$tabSpace All My Task',
                      icon: Icons.check_circle_outline,
                      margin: 5.0,
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    ]));
  }
}
