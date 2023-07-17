import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';
import 'package:yourself_in_time_project/common/constants/app_colors.dart';
import 'package:yourself_in_time_project/common/values/spacing.dart';
import 'package:yourself_in_time_project/common/widgets/Buttons/primary_progress_button.dart';

import 'package:yourself_in_time_project/common/widgets/Profile/badged_container.dart';
import 'package:yourself_in_time_project/common/widgets/container_label.dart';
import 'package:yourself_in_time_project/common/widgets/darkBackground/dark_radial_background.dart';
import 'package:yourself_in_time_project/common/widgets/dummy/profile_dummy.dart';
import 'package:yourself_in_time_project/core/di/get_it.dart';
import 'package:yourself_in_time_project/core/services/auth_service.dart';
import 'package:yourself_in_time_project/ui/profile/my_profile.dart';
import 'package:yourself_in_time_project/ui/profile/profile_notification.dart';
import 'package:yourself_in_time_project/ui/profile/profile_view_model.dart';

import '../../common/widgets/profile/text_outlined_button_with_text.dart';
import '../../common/widgets/shapes/rounded_border_with_icon.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
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
    AuthService _autservice = AuthService();
    return ViewModelBuilder<ProfileViewModel>.reactive(
        viewModelBuilder: () => getIt<ProfileViewModel>(),
        disposeViewModel: false,
        builder: (context, model, child) => Scaffold(
              body: Stack(children: [
                Positioned(
                  top: 40,
                  left: 30,
                  child: RoundedBorderWithIcon(
                    onpressed: () {
                      Get.back();
                    },
                    color: Colors.black,
                    icon: Icons.arrow_back,
                  ),
                ),
                Positioned(
                  child: Padding(
                    padding: EdgeInsets.only(left: 20, right: 20, top: 40),
                    child: SafeArea(
                        child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: ProfileDummy(
                                color: HexColor.fromHex("94F0F1"),
                                dummyType: ProfileDummyType.Image,
                                scale: 3.0,
                                image: "assets/images/man-head.png"),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("${name}",
                                style: GoogleFonts.lato(
                                    color: Colors.blue,
                                    fontSize: 40,
                                    fontWeight: FontWeight.bold)),
                          ),
                          Text("${FirebaseAuth.instance.currentUser!.email}",
                              style: GoogleFonts.lato(
                                  color: Colors.blue, fontSize: 17)),
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: OutlinedButtonWithText(
                              width: 150,
                              content: "View Profile",
                              onPressed: () {
                                Get.to(() => ProfilePage());
                              },
                            ),
                          ),
                          AppSpaces.verticalSpace20,
                          ContainerLabel(label: "Workspace"),
                          AppSpaces.verticalSpace10,
                          Container(
                            width: double.infinity,
                            height: 90,
                            padding: EdgeInsets.all(20.0),
                            decoration: BoxDecoration(
                                color: Color(0xFFABCDF4),
                                borderRadius: BorderRadius.circular(10)),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        ProfileDummy(
                                            color: HexColor.fromHex("94F0F1"),
                                            dummyType: ProfileDummyType.Image,
                                            scale: 1.20,
                                            image:
                                                "assets/images/man-head.png"),
                                        AppSpaces.horizontalSpace20,
                                        Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text("UI8 Design",
                                                  style: GoogleFonts.lato(
                                                      color: Colors.white,
                                                      fontSize: 17,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                              SizedBox(height: 5),
                                              Text("hello@ui8.net",
                                                  style: GoogleFonts.lato(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: HexColor.fromHex(
                                                          "5E6272")))
                                            ])
                                      ]),
                                  PrimaryProgressButton(
                                    width: 90,
                                    height: 40,
                                    label: "Invite",
                                    textStyle: GoogleFonts.lato(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  )
                                ]),
                          ),
                          AppSpaces.verticalSpace20,
                          ContainerLabel(label: "Notification"),
                          AppSpaces.verticalSpace10,
                          BadgedContainer(
                            label: "Do not disturb",
                            callback: () {
                              Get.to(() => ProfileNotificationSettings());
                            },
                            value: "Off",
                            badgeColor: "FDA5FF",
                          ),
                          AppSpaces.verticalSpace20,
                          GestureDetector(
                            onTap: () {
                              _autservice.signOut();
                              model.backLogin();
                            },
                            child: Container(
                                width: double.infinity,
                                height: 50,
                                decoration: BoxDecoration(
                                    color: Colors.amber,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Center(
                                  child: Text("Log Out",
                                      style: GoogleFonts.lato(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold)),
                                )),
                          )
                        ],
                      ),
                    )),
                  ),
                ),
              ]),
            ));
  }
}
