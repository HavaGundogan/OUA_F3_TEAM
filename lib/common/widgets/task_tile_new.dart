// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yourself_in_time_project/common/values/theme.dart';
import 'package:yourself_in_time_project/common/widgets/dol_durma_clipper.dart';
import 'package:yourself_in_time_project/core/services/auth_service.dart';

class TaskTileNew extends StatefulWidget {
  final bool shouldShowCompleteStatus;

  const TaskTileNew({
    Key? key,
    required this.shouldShowCompleteStatus,
  }) : super(key: key);
  @override
  State<TaskTileNew> createState() => _TaskTileNewState();
}

class _TaskTileNewState extends State<TaskTileNew> {
  AuthService _authService = AuthService();

  String title = '';
  int? isComleted;
  String desc = '';
  String taskStatusUpdate = '';
  String startDate = '';
  String endDate = '';
  int boardId = 2;

  @override
  void initState() {
    super.initState();
    fetchTitleData();
  }

  void fetchTitleData() async {
    String? fetchedTitle = await _authService.getTitleFromFirestore();
    int? fetchedisCompleted = await _authService.getisCompletedFromFirestore();
    int fetchedBoardId = await _authService.getBoardIdFromFirestore();
    String? fetchedDesc = await _authService.getdescFromFirestore();
    String? fetchedStart = await _authService.getStartDateFromFirestore();
    String? fetchedEnd = await _authService.getEndDateFromFirestore();
    String? fetchedtaskStatus = await _authService.getTaskStateFromFirestore();
    setState(() {
      title = fetchedTitle!;
      desc = fetchedDesc!;
      isComleted = fetchedisCompleted;
      startDate = fetchedStart!;
      endDate = fetchedEnd!;
      taskStatusUpdate = fetchedtaskStatus!;
      boardId = fetchedBoardId;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
                      color: _getBGClr(boardId),
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
                              child: Text(title,
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
                              child: Text(desc,
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
            ]));
  }

  _getStatus() {
    var status = "TODO";
    if (widget.shouldShowCompleteStatus == true) {
      if (isComleted == 1) {
        status = "COMPLETED";
      } else
        status = "TODO";
    } else {
      status = "TODO";
    }
    return status;
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
}
