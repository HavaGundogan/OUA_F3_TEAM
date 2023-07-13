// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:yourself_in_time_project/common/constants/colors_constants.dart';
import 'package:yourself_in_time_project/common/values/theme.dart';
import 'package:yourself_in_time_project/common/widgets/dol_durma_clipper.dart';
import 'package:yourself_in_time_project/core/services/auth_service.dart';
import 'package:yourself_in_time_project/ui/task/task_detail.dart';

class TaskTileNew extends StatefulWidget {
  final VoidCallback onDelete;
  final bool shouldShowCompleteStatus;
  final dynamic model;
  int index;
  TaskTileNew({
    Key? key,
    required this.onDelete,
    required this.shouldShowCompleteStatus,
    required this.model,
    required this.index,
  }) : super(key: key);
  @override
  State<TaskTileNew> createState() => _TaskTileNewState();
}

class _TaskTileNewState extends State<TaskTileNew> {
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
    return KeyedSubtree(
      key: widget.key,
      child: GestureDetector(
        onTap: () {
          if (isCompleted == false) {
            showBottomSheet();
          } else {}
        },
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(bottom: 12),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipPath(
                    clipper: DolDurmaClipper(right: 40, holeRadius: 20),
                    child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(15),
                          ),
                          color: _getBGClr(boardId!),
                        ),
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.all(15),
                        child: Row(children: [
                          Expanded(
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 25),
                                  child: Text(title!,
                                      maxLines: 1, style: boldTextStyle16),
                                ),
                                SizedBox(
                                  height: 12,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.access_time_rounded,
                                      color: Colors.black87,
                                      size: 18,
                                    ),
                                    SizedBox(width: 4),
                                    Text(
                                      "${startDate} AM - ${endDate} AM",
                                      style: GoogleFonts.lato(
                                        textStyle: normalTextStyle12,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 12),
                                Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: Text(desc!,
                                      style: GoogleFonts.lato(
                                        textStyle: normalTextStyle14,
                                      ),
                                      maxLines: 2),
                                ),
                              ])),
                          RotatedBox(
                            quarterTurns: 3,
                            child: Text(
                              _getStatus(),
                              style: GoogleFonts.lato(
                                textStyle: boldTextStyle14,
                              ),
                            ),
                          ),
                        ])),
                  )
                ])),
      ),
    );
  }

  _getStatus() {
    var status = "TODO";

    if (widget.shouldShowCompleteStatus == true) {
      if (isCompleted == true) {
        status = "COMPLETED";
      } else
        status = "TODO";
    } else {
      status = "TODO";
    }
    return status;
  }

  showBottomSheet() {
    Get.bottomSheet(
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          color: Colors.white,
        ),
        padding: EdgeInsets.all(10),
        height: MediaQuery.of(context).size.height * 0.38,
        child: Column(
          children: [
            Container(
              height: 6,
              width: 120,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50), color: Colors.grey),
            ),
            SizedBox(
              height: 20,
            ),
            bottomSheetButton(
                context: context,
                label: "View Task",
                color: ColorConstants.buttonColor,
                onTap: () async {
                  Get.to(() => TaskDetailView(
                      startDate: startDate!,
                      myTasks: myTasks!,
                      isIconChange: isTaskCompleted!,
                      title: title!,
                      desc: desc!,
                      category: category!,
                      endDate: endDate!));
                }),
            bottomSheetButton(
              context: context,
              label: "Mark as Complete",
              color: ColorConstants.buttonColor,
              onTap: () {
                setState(
                  () {
                    _authService.updatedTaskCompletionStatus(
                        widget.index, true);
                    _refreshData();
                    Get.back();
                  },
                );
              },
            ),
            bottomSheetButton(
                context: context,
                label: "Delete Task",
                color: ColorConstants.buttonColor,
                onTap: () {
                  widget.onDelete();
                  setState(() {
                    _authService.deleteTaskCompletionStatus(
                      widget.index,
                    );
                  });
                  Get.back();

                  _refreshData();
                }),
            bottomSheetButton(
              context: context,
              label: "Close",
              color: Colors.red,
              onTap: () {
                Get.back();
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget bottomSheetButton(
      {required BuildContext context,
      required String label,
      required Function() onTap,
      required Color color,
      bool isClose = false}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.all(5),
        height: 50,
        width: MediaQuery.of(context).size.width * 0.9,
        decoration: BoxDecoration(
            border: Border.all(
                width: 2, color: isClose == true ? Colors.red : color),
            borderRadius: BorderRadius.circular(10),
            color: isClose ? Colors.transparent : color),
        child: Center(
            child: Text(
          label,
          style: TextStyle(color: Colors.white),
        )),
      ),
    );
  }

  _getBGClr(int no) {
    switch (no) {
      case 0:
        return Color(0xFFfd7f6f);
      case 1:
        return Color(0xFF7eb0d5);
      case 2:
        return Color(0xFFb2e061);
      case 3:
        return Color(0xFFbd7ebe);
      case 4:
        return Color(0xFFffb55a);
      case 5:
        return Color(0xFFffee65);
      case 6:
        return Color(0xFFbeb9db);
      case 7:
        return Color(0xFFfdcce5);
      case 8:
        return Color(0xFF8bd3c7);
      default:
        return Color(0xFF6cd4c5);
    }
  }

  void _refreshData() {
    fetchTitleData();
  }
}
