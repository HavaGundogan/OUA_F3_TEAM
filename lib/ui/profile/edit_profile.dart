import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yourself_in_time_project/common/constants/app_colors.dart';
import 'package:yourself_in_time_project/common/values/spacing.dart';
import 'package:yourself_in_time_project/common/widgets/Buttons/primary_progress_button.dart';
import 'package:yourself_in_time_project/common/widgets/Navigation/app_header.dart';
import 'package:yourself_in_time_project/common/widgets/darkBackground/dark_radial_background.dart';
import 'package:yourself_in_time_project/common/widgets/dummy/profile_dummy.dart';
import 'package:yourself_in_time_project/common/widgets/forms/form_input_with_labelled_form_input.dart';

class EditProfilePage extends StatelessWidget {
  EditProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String tabSpace = "\t\t\t";
    final _nameController = new TextEditingController();
    final _passController = new TextEditingController();
    final _emailController = new TextEditingController();
    final _roleController = new TextEditingController();
    final _aboutController = new TextEditingController();
    return Scaffold(
        body: Stack(children: [
      DarkRadialBackground(
        color: HexColor.fromHex("#181a1f"),
        position: "topLeft",
      ),
      Padding(
          padding: EdgeInsets.only(left: 20, right: 20),
          child: SafeArea(
              child: SingleChildScrollView(
                  child: Column(children: [
            TaskezAppHeader(
              title: "$tabSpace Edit Profile",
              widget: PrimaryProgressButton(
                width: 80,
                height: 40,
                label: "Done",
                textStyle: GoogleFonts.lato(
                    color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 30),
            Stack(
              children: [
                ProfileDummy(
                    color: HexColor.fromHex("94F0F1"),
                    dummyType: ProfileDummyType.Image,
                    scale: 3.0,
                    image: "assets/images/man-head.png"),
                Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                        color: AppColors.primaryAccentColor.withOpacity(0.75),
                        shape: BoxShape.circle),
                    child: Icon(FeatherIcons.camera,
                        color: Colors.white, size: 20))
              ],
            ),
            AppSpaces.verticalSpace20,
            LabelledFormInput(
                placeholder: "Name Surname",
                keyboardType: "text",
                controller: _nameController,
                obscureText: false,
                label: "Your Name"),
            AppSpaces.verticalSpace20,
            LabelledFormInput(
                placeholder: "e-mail",
                keyboardType: "text",
                controller: _emailController,
                obscureText: true,
                label: "Your Email"),
            AppSpaces.verticalSpace20,
            LabelledFormInput(
                placeholder: "HikLHjD@&1?>",
                keyboardType: "text",
                controller: _passController,
                obscureText: true,
                label: "Your Password"),
            AppSpaces.verticalSpace20,
            LabelledFormInput(
                placeholder: "Visual Designer",
                keyboardType: "text",
                controller: _roleController,
                obscureText: true,
                label: "Role"),
            AppSpaces.verticalSpace20,
            LabelledFormInput(
                placeholder: "Design & Cat Person",
                keyboardType: "text",
                controller: _aboutController,
                obscureText: true,
                label: "About Me"),
          ]))))
    ]));
  }
}
