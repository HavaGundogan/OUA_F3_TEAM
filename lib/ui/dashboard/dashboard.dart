import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yourself_in_time_project/common/bottomSheets/bottom_sheets.dart';
import 'package:yourself_in_time_project/common/values/spacing.dart';
import 'package:yourself_in_time_project/common/widgets/bottom_sheets/dashboard_settings_bottom_sheet.dart';
import 'package:yourself_in_time_project/common/widgets/buttons/primary_tab_button.dart';
import 'package:yourself_in_time_project/common/widgets/navigation/dashboard_header.dart';
import 'package:yourself_in_time_project/common/widgets/shapes/app_shapes_icon.dart';
import 'package:yourself_in_time_project/core/services/auth_service.dart';
import 'package:yourself_in_time_project/ui/dashboard/dashboardTabScreen/overview.dart';
import 'package:yourself_in_time_project/ui/dashboard/dashboardTabScreen/productivity.dart';
import 'package:yourself_in_time_project/ui/messages/messages_view.dart';
import 'package:yourself_in_time_project/ui/profile/profile_view.dart';

// ignore: must_be_immutable
class Dashboard extends StatefulWidget {
  Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  ValueNotifier<bool> _totalTaskTrigger = ValueNotifier(true);

  ValueNotifier<bool> _totalDueTrigger = ValueNotifier(false);

  ValueNotifier<bool> _totalCompletedTrigger = ValueNotifier(true);

  ValueNotifier<bool> _workingOnTrigger = ValueNotifier(false);

  ValueNotifier<int> _buttonTrigger = ValueNotifier(0);

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
    return Padding(
        padding: EdgeInsets.all(20.0),
        child: SafeArea(
          child: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              DashBoardNav(
                icon: FontAwesomeIcons.rocket,
                iconColor: Colors.blue,
                image: "assets/images/man-head.png",
                page: MessagesView(),
                title: "Dashboard",
                onImageTapped: () {
                  Get.to(() => ProfileView());
                },
              ),
              AppSpaces.verticalSpace20,
              Text("Hello,\n ${name} 👋",
                  style: GoogleFonts.lato(
                      color: Colors.black.withOpacity(0.7),
                      fontSize: 40,
                      fontWeight: FontWeight.bold)),
              AppSpaces.verticalSpace20,
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                //tab indicators
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    PrimaryTabButton(
                        buttonText: "Overview",
                        itemIndex: 0,
                        notifier: _buttonTrigger),
                    PrimaryTabButton(
                        buttonText: "Productivity",
                        itemIndex: 1,
                        notifier: _buttonTrigger)
                  ],
                ),
                Container(
                    alignment: Alignment.centerRight,
                    child: AppSettingsIcon(
                      callback: () {
                        showAppBottomSheet(
                          DashboardSettingsBottomSheet(
                            totalTaskNotifier: _totalTaskTrigger,
                            totalDueNotifier: _totalDueTrigger,
                            workingOnNotifier: _workingOnTrigger,
                            totalCompletedNotifier: _totalCompletedTrigger,
                          ),
                        );
                      },
                    ))
              ]),
              AppSpaces.verticalSpace20,
              ValueListenableBuilder(
                  valueListenable: _buttonTrigger,
                  builder: (BuildContext context, index, __) {
                    return _buttonTrigger.value == 0
                        ? DashboardOverview(index: index)
                        : DashboardProductivity();
                  })
            ]),
          ),
        ));
  }
}
