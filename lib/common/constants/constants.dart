import 'package:flutter/material.dart';
import 'package:yourself_in_time_project/common/constants/app_colors.dart';
import 'package:yourself_in_time_project/ui/dashboard/dashboard.dart';

import 'package:yourself_in_time_project/ui/messages/messages.dart';
import 'package:yourself_in_time_project/ui/motivation/motivation_screen.dart';
import 'package:yourself_in_time_project/ui/profile/my_profile.dart';

String tabSpace = "\t\t\t";
final List<Widget> dashBoardScreens = [
  Dashboard(),
  MotivationScreen(
    title: 'Date',
  ), //argümen aldı
  MyHomePage(title: "Messages"),
  ProfilePage()
];
List<Color> progressCardGradientList = [
  //grenn
  HexColor.fromHex("87EFB5"),
  //blue
  HexColor.fromHex("8ABFFC"),
  //pink
  HexColor.fromHex("EEB2E8"),
];

// Data verileri çekilecek...
