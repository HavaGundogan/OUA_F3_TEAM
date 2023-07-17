import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yourself_in_time_project/common/constants/app_colors.dart';
import 'package:yourself_in_time_project/common/values/spacing.dart';
import 'package:yourself_in_time_project/common/widgets/Profile/profile_text_option.dart';
import 'package:yourself_in_time_project/common/widgets/darkBackground/dark_radial_background.dart';
import 'package:yourself_in_time_project/common/widgets/dummy/profile_dummy.dart';
import 'package:yourself_in_time_project/common/widgets/navigation/default_back.dart';
import 'package:yourself_in_time_project/common/widgets/profile/text_outlined_button_with_text.dart';
import 'package:yourself_in_time_project/core/services/auth_service.dart';
import 'package:yourself_in_time_project/ui/home/home_view_model.dart';
import 'package:yourself_in_time_project/ui/profile/edit_profile.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final ValueNotifier<bool> totalTaskNotifier = ValueNotifier(true);
  final String tabSpace = "\t\t";
  AuthService _authService = AuthService();
  String name = '';

  @override
  initState() {
    super.initState();
    getName();
  }

  @override
  dispose() {
    super.dispose();
  }

  Future<String> getName() async {
    String nameData = await _authService.getUserName();
    setState(() {
      name = nameData;
    });
    return name;
  }

  @override
  Widget build(BuildContext context) {
    HomeViewModel homeViewModel = HomeViewModel();

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
                  child: Text("${name.toString()}",
                      style: GoogleFonts.lato(
                          color: Colors.black,
                          fontSize: 40,
                          fontWeight: FontWeight.bold)),
                ),
                Text("${FirebaseAuth.instance.currentUser!.email}",
                    style: GoogleFonts.lato(color: Colors.blue, fontSize: 17)),
                AppSpaces.verticalSpace20,
                Column(
                  children: [
                    AppSpaces.verticalSpace10,
                    ProfileTextOption(
                      onPressed: () {},
                      label: '$tabSpace Favorites',
                      icon: Icons.favorite,
                      margin: 5.0,
                    ),
                    AppSpaces.verticalSpace10,
                    ProfileTextOption(
                      onPressed: () {},
                      label: '$tabSpace Share Profile',
                      icon: FeatherIcons.share2,
                      margin: 5.0,
                    ),
                    AppSpaces.verticalSpace10,
                    ProfileTextOption(
                      onPressed: () {
                        homeViewModel.nextView();
                      },
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
