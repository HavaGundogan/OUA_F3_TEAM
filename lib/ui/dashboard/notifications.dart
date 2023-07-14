import 'package:flutter/material.dart';
import 'package:yourself_in_time_project/common/values/spacing.dart';

import 'package:yourself_in_time_project/common/widgets/Notification/notification_card.dart';
import 'package:yourself_in_time_project/common/widgets/dummy/profile_dummy.dart';
import 'package:yourself_in_time_project/common/widgets/navigation/default_back.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final dynamic notificationData = AppData.notificationMentions;

    // List<Widget> notificationCards = List.generate(
    //   notificationData.length,
    // (index) => NotificationCard(
    //     read: notificationData[index]['read'],
    //   userName: notificationData[index]['mentionedBy'],
    // date: notificationData[index]['date'],
    //image: notificationData[index]['profileImage'],
    //          mentioned: notificationData[index]['hashTagPresent'],
    //        message: notificationData[index]['message'],
    //      mention: notificationData[index]['mentionedIn'],
    //    imageBackground: notificationData[index]['color'],
    //  userOnline: notificationData[index]['userOnline'],
    // ));
    List<Widget> notificationCards = List.generate(
        5,
        (index) => NotificationCard(
              read: true,
              userName: "ulas",
              date: "02.08.2000",
              image: "assets/images/google.png",
              mentioned: false,
              message: "notificationData[index]['message']",
              mention: "gel",
              imageBackground: "000000",
              userOnline: true,
            ));
    return Padding(
        padding: EdgeInsets.only(left: 20.0, right: 20.0),
        child: SafeArea(
          child: Column(children: [
            DefaultNav(title: "Notification", type: ProfileDummyType.Image),
            AppSpaces.verticalSpace20,
            Expanded(child: ListView(children: [...notificationCards]))
          ]),
        ));
  }
}
