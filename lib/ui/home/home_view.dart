import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:stacked/stacked.dart';
import 'package:yourself_in_time_project/common/bottomSheets/bottom_sheets.dart';
import 'package:yourself_in_time_project/common/constants/constants.dart';
import 'package:yourself_in_time_project/common/widgets/darkBackground/dark_radial_background.dart';
import 'package:yourself_in_time_project/common/widgets/dashboard/bottom_navigation_item.dart';
import 'package:yourself_in_time_project/common/widgets/dashboard/dashboard_add_bottom_sheet.dart';
import 'package:yourself_in_time_project/common/widgets/dashboard/dashboard_add_button.dart';
import 'package:yourself_in_time_project/core/di/get_it.dart';
import 'package:yourself_in_time_project/core/utils/utils.dart';
import 'package:yourself_in_time_project/ui/dashboard/dashboard.dart';
import 'package:yourself_in_time_project/ui/home/home_view_model.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  HomeViewModel homeViewModel = HomeViewModel();
  ValueNotifier<int> bottomNavigatorTrigger = ValueNotifier(0);
  final PageStorageBucket bucket = PageStorageBucket();
  Dashboard currentScreen = Dashboard();
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
        viewModelBuilder: () => getIt<HomeViewModel>(),
        disposeViewModel: false,
        builder: (context, model, child) => Scaffold(
            backgroundColor: Colors.white, //tabbar üstündeki beyazlık
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            body: Stack(children: [
              DarkRadialBackground(
                color: Colors.white, //background rengi burası
                position: "topLeft",
              ),
              ValueListenableBuilder(
                  valueListenable: bottomNavigatorTrigger,
                  builder: (BuildContext context, _, __) {
                    return PageStorage(
                        child: dashBoardScreens[bottomNavigatorTrigger.value],
                        bucket: bucket);
                  })
            ]),
            bottomNavigationBar: buildBottomNav()));
  }

  Container buildBottomNav() {
    return Container(
        width: double.infinity,
        height: 90,
        padding: EdgeInsets.only(top: 10, right: 30, left: 30),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            color: Color(0xFF0066DA)), //en alttaki tabbar rengi
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              BottomNavigationItem(
                  itemIndex: 0,
                  notifier: bottomNavigatorTrigger,
                  icon: Icons.widgets),
              Spacer(),
              BottomNavigationItem(
                  itemIndex: 1,
                  notifier: bottomNavigatorTrigger,
                  icon: Icons.mood),
              Spacer(),
              DashboardAddButton(
                iconTapped: (() {
                  homeViewModel.programNextView();
                }),
              ),
              Spacer(),
              BottomNavigationItem(
                  itemIndex: 2,
                  notifier: bottomNavigatorTrigger,
                  icon: FeatherIcons.messageSquare),
              Spacer(),
              BottomNavigationItem(
                  itemIndex: 3,
                  notifier: bottomNavigatorTrigger,
                  icon: Icons.account_circle)
            ]));
  }
}
