// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';

import 'package:yourself_in_time_project/common/constants/colors_constants.dart';
import 'package:yourself_in_time_project/common/values/theme.dart';
import 'package:yourself_in_time_project/core/di/get_it.dart';
import 'package:yourself_in_time_project/core/services/auth_service.dart';
import 'package:yourself_in_time_project/ui/task/task_detail_view_model.dart';

class TaskDetailView extends StatefulWidget {
  final List<bool> isIconChange;
  final String title;
  final String desc;
  final String category;
  final String endDate;
  final String startDate;
  final bool import = false;
  final List<String> myTasks;
  TaskDetailView({
    Key? key,
    required this.isIconChange,
    required this.title,
    required this.desc,
    required this.category,
    required this.endDate,
    required this.myTasks,
    required this.startDate,
  }) : super(key: key);

  @override
  State<TaskDetailView> createState() => _TaskDetailView();
}

class _TaskDetailView extends State<TaskDetailView> {
  List<bool> isChangedNew = [];
  @override
  Widget build(BuildContext context) {
    AuthService _authService = AuthService();
    return ViewModelBuilder<TaskDetailViewModel>.reactive(
        viewModelBuilder: () => getIt<TaskDetailViewModel>(),
        disposeViewModel: false,
        builder: (context, model, child) => Scaffold(
            appBar: _appBar(context),
            body: SingleChildScrollView(
              child: Padding(
                  padding: const EdgeInsets.only(left: 24.0, right: 24.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Container(
                            margin: EdgeInsets.only(top: 10),
                            padding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.red),
                            child: Text(widget.title,
                                style: taskTitleStyle,
                                textAlign: TextAlign.center),
                          ),
                        ),
                        SizedBox(height: 15),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 15),
                            Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: ColorConstants.buttonColor
                                        .withOpacity(0.2)),
                                child: Padding(
                                  padding: const EdgeInsets.all(30.0),
                                  child: Text(widget.desc,
                                      style: normalTextStyle18),
                                )),
                            SizedBox(height: 20),
                            Row(
                              children: [
                                Icon(
                                  Icons.notifications,
                                  color: ColorConstants.iconColor,
                                ),
                                SizedBox(width: 10),
                                Text("Jul 10, 2023", style: headingStyle),
                              ],
                            ),
                            SizedBox(height: 20),
                            ListView.builder(
                                shrinkWrap: true,
                                itemCount: widget.myTasks.length,
                                itemBuilder: (context, index) {
                                  return Column(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(
                                          top: 10,
                                        ),
                                        width:
                                            MediaQuery.of(context).size.width,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Colors.black
                                                      .withOpacity(0.5),
                                                  blurRadius: 0.2,
                                                  offset: Offset(0, 2))
                                            ]),
                                        child: ListTile(
                                          leading: widget.isIconChange[index]
                                              ? Icon(
                                                  Icons.check,
                                                  color: Colors.green,
                                                )
                                              : Icon(
                                                  Icons.cancel,
                                                  color: Colors.grey,
                                                ),
                                          title: TextField(
                                            enabled: false,
                                            style:
                                                TextStyle(color: Colors.white),
                                            decoration: InputDecoration(
                                                border: InputBorder.none,
                                                hintText: widget.myTasks[index],
                                                hintStyle: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 17,
                                                ),
                                                contentPadding: EdgeInsets.only(
                                                    left: 20, right: 20)),
                                            onChanged: (value) {
                                              widget.myTasks[index] = value;
                                            },
                                          ),
                                          trailing: Container(
                                            width: 70,
                                            height: 30,
                                            child: ElevatedButton(
                                              style: ButtonStyle(
                                                  backgroundColor:
                                                      MaterialStatePropertyAll(
                                                          ColorConstants
                                                              .iconColor),
                                                  shape: MaterialStateProperty.all<
                                                          RoundedRectangleBorder>(
                                                      RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10)))),
                                              onPressed: () {
                                                setState(() {
                                                  widget.isIconChange[index] =
                                                      true;
                                                });
                                              },
                                              child: Text(
                                                "Done",
                                                style: GoogleFonts.ubuntu(
                                                    color: Colors.white,
                                                    fontSize: 12),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Divider(
                                        height: 1,
                                        thickness: 1,
                                        color: Colors.white,
                                      )
                                    ],
                                  );
                                }),
                            SizedBox(height: 10),
                            Divider(
                              thickness: 1,
                            ),
                            SizedBox(height: 10),
                            Row(
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Start Time',
                                        style: normalTextStyle16),
                                    SizedBox(height: 10),
                                    Row(
                                      children: [
                                        Icon(Icons.timelapse,
                                            color: ColorConstants.iconColor),
                                        SizedBox(width: 10),
                                        Text(widget.startDate,
                                            style: headingStyle),
                                      ],
                                    )
                                  ],
                                ),
                                Spacer(),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('End Time', style: normalTextStyle16),
                                    SizedBox(height: 10),
                                    Row(
                                      children: [
                                        Icon(Icons.timelapse,
                                            color: ColorConstants.iconColor),
                                        SizedBox(width: 10),
                                        Text(widget.endDate,
                                            style: headingStyle),
                                      ],
                                    )
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            Divider(
                              thickness: 1,
                            ),
                            SizedBox(height: 10),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Task Board', style: normalTextStyle16),
                                SizedBox(height: 12),
                                Row(
                                  children: [
                                    ThemeService.getBoardIconForDetail(
                                      "",
                                    ),
                                    SizedBox(width: 10),
                                    Text(widget.category, style: headingStyle),
                                  ],
                                )
                              ],
                            ),
                            SizedBox(height: 50),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    height: 40,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.red.shade400
                                        //color: Get.isDarkMode ? Colors.greenAccent: Color.amberAccent)),
                                        ),
                                    child: Center(
                                        child: Text(
                                      "Delete Task",
                                      style: TextStyle(color: Colors.white),
                                    )),
                                  )),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              child: GestureDetector(
                                  onTap: () async {},
                                  child: Container(
                                    height: 40,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: ColorConstants.buttonColor),
                                    child: Center(
                                        child: Text(
                                      "Edit Task",
                                      style: TextStyle(color: Colors.white),
                                    )),
                                  )),
                            )
                          ],
                        )
                      ])),
            )));
  }

  _appBar(BuildContext context) {
    return AppBar(
        iconTheme: IconThemeData(color: ColorConstants.iconColor),
        //backgroundColor: context.theme.backgroundColor,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: ColorConstants.iconColor),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text("Task Detail", style: toolbarTitleStyle),
        centerTitle: true);
  }
}
