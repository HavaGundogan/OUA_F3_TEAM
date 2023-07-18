// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:tcard/tcard.dart';

import 'package:yourself_in_time_project/common/constants/app_colors.dart';
import 'package:yourself_in_time_project/common/values/spacing.dart';
import 'package:yourself_in_time_project/common/widgets/Dashboard/overview_task_container.dart';
import 'package:yourself_in_time_project/common/widgets/dashboard/next_over_view.dart';
import 'package:yourself_in_time_project/common/widgets/dashboard/next_series_overview.dart';
import 'package:yourself_in_time_project/common/widgets/dashboard/task_container_card.dart';
import 'package:yourself_in_time_project/core/services/auth_service.dart';
import 'package:yourself_in_time_project/ui/home/home_view_model.dart';

class DashboardOverview extends StatefulWidget {
  final int index;
  DashboardOverview({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  State<DashboardOverview> createState() => _DashboardOverviewState();
}

class _DashboardOverviewState extends State<DashboardOverview> {
  AuthService _authService = AuthService();
  List<String>? myTasks;
  String? title = '';
  bool? isCompleted;
  List<bool>? isTaskCompleted;
  String? desc = '';
  String? category = '';
  String? taskStatusUpdate = '';
  String? startDate = '';
  String? endDate = '';
  int? boardId = 2;
  bool _isDisposed = false;

  bool? isMyTask = false;
  @override
  void initState() {
    super.initState();
    fetchTitleData();
  }

  @override
  void dispose() {
    _isDisposed = true;
    super.dispose();
  }

  void fetchTitleData() async {
    List<String>? fetchedMyTask =
        await _authService.getMyTasksFromFirestore(widget.index);
    List<bool>? fetchedisTaskCompleted =
        await _authService.getTitleisTaskComplete(widget.index);
    String? fetchedTitle =
        await _authService.getTitleFromFirestore(widget.index);
    String? fetchedCategory =
        await _authService.getCategoryFromFirestore(widget.index);
    bool? fetchedisCompleted =
        await _authService.getisCompletedFromFirestore(widget.index);
    int fetchedBoardId =
        await _authService.getBoardIdFromFirestore(widget.index);
    String? fetchedDesc = await _authService.getdescFromFirestore(widget.index);
    String? fetchedStart =
        await _authService.getStartDateFromFirestore(widget.index);
    String? fetchedEnd =
        await _authService.getEndDateFromFirestore(widget.index);
    String? fetchedtaskStatus =
        await _authService.getTaskStateFromFirestore(widget.index);
    if (!_isDisposed) {
      setState(() {
        isTaskCompleted = fetchedisTaskCompleted;
        myTasks = fetchedMyTask;
        title = fetchedTitle!;
        desc = fetchedDesc!;
        isCompleted = fetchedisCompleted;
        startDate = fetchedStart!;
        endDate = fetchedEnd!;
        taskStatusUpdate = fetchedtaskStatus!;
        boardId = fetchedBoardId;
        category = fetchedCategory;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (myTasks == null) {
      return buildTasks();
    } else {
      List<Widget> cards = List.generate(
        1,
        (index) => TaskProgressCard(
          cardTitle: title!,
          startDate: startDate!,
          endDate: endDate!,
          progressFigure: "12.75",
          percentageGap: 1,
          desc: desc!,
        ),
      );

      return Column(
        children: [
          Container(
            height: 180,
            child: title == ''
                ? Center(child: CircularProgressIndicator())
                : TCard(
                    cards: cards,
                  ),
          ),
          AppSpaces.verticalSpace10,
          buildTasks(),
        ],
      );
    }
  }

  Column buildTasks() {
    return Column(
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
    );
  }

  nextView() {}
}
