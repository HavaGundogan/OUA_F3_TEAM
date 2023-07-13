// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:tcard/tcard.dart';

import 'package:yourself_in_time_project/common/constants/app_colors.dart';
import 'package:yourself_in_time_project/common/values/spacing.dart';
import 'package:yourself_in_time_project/common/widgets/Dashboard/overview_task_container.dart';
import 'package:yourself_in_time_project/common/widgets/dashboard/next_over_view.dart';
import 'package:yourself_in_time_project/common/widgets/dashboard/next_series_overview.dart';
import 'package:yourself_in_time_project/common/widgets/dashboard/task_container_card.dart';
import 'package:yourself_in_time_project/ui/home/home_view_model.dart';

class DashboardOverview extends StatelessWidget {
  DashboardOverview({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // final dynamic data = AppData.progressIndicatorList;  veritabanından gelicek veriler

    // List<Widget> cards = List.generate(
    //     5,
    //    (index) => TaskProgressCard(
    //         cardTitle: data[index]['cardTitle'],
    //         rating: data[index]['rating'],
    //         progressFigure: data[index]['progress'],
    //        percentageGap: int.parse(data[index]['progressBar']),
    //      ));

    List<Widget> cards = List.generate(
      3,
      (index) => TaskProgressCard(
          cardTitle: "12",
          rating: "12",
          progressFigure: "12",
          percentageGap: 3),
    );
    return Column(
      children: [
        Container(
          height: 150,
          child: TCard(
            cards: cards,
          ),
        ),
        AppSpaces.verticalSpace10,
        Column(
          children: [
            NextSeriesOverView(
              cardTitle: "My Series",
              numberOfItems: "16",
              imageUrl: "assets/images/series.png",
              backgroundColor: Colors.white,
            ),
            NextOverView(
                cardTitle: "Completed",
                numberOfItems: "32",
                imageUrl: "assets/images/completed.png",
                backgroundColor: HexColor.fromHex("7FBC69")),
            OverviewTaskContainer(
                cardTitle: "My Tasks",
                numberOfItems: "8",
                imageUrl: "assets/images/gorse.png",
                backgroundColor: HexColor.fromHex("EFA17D")),
          ],
        ),
      ],
    );
  }

  nextView() {}
}
