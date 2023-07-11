// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:yourself_in_time_project/common/constants/colors_constants.dart';
import 'package:yourself_in_time_project/common/values/theme.dart';
import 'package:yourself_in_time_project/core/services/auth_service.dart';

class TaskDetailPage extends StatefulWidget {
  TaskDetailPage({
    Key? key,
  }) : super(key: key);

  @override
  State<TaskDetailPage> createState() => _TaskDetailPageState();
}

class _TaskDetailPageState extends State<TaskDetailPage> {
  AuthService? _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    final String title = "Ulas";
    final String desc = "asdasddasadsaddsaasdasdasdasdadassdaadsad";
    final String category = "Fitnesss";
    final String endDate = "02.08.2000";
    final String startDate = "12112.12";
    final String taskState = "Important";
    List<String> myTasks = ["ulas"];
    List<bool?> checkboxValues = [false, true];
    bool? isChecked = false;
    bool? import;
    void deleteItem(int index) {
      myTasks.removeAt(index);
    }

    return Scaffold(
        appBar: _appBar(context),
        body: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.only(left: 24.0, right: 24.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        width: 140,
                        height: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.red),
                        child: Center(
                            child: Text(taskState,
                                style: GoogleFonts.ubuntu(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20)))),
                    SizedBox(height: 15),
                    Center(
                      child: Text(title,
                          style: taskTitleStyle, textAlign: TextAlign.center),
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
                              child: Text(desc, style: normalTextStyle18),
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
                            itemCount: myTasks.length,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(
                                      top: 10,
                                    ),
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(15),
                                        boxShadow: [
                                          BoxShadow(
                                              color:
                                                  Colors.black.withOpacity(0.5),
                                              blurRadius: 0.2,
                                              offset: Offset(0, 2))
                                        ]),
                                    child: ListTile(
                                      leading: Checkbox(
                                        value: checkboxValues[index],
                                        activeColor: Colors.blue,
                                        tristate: true,
                                        onChanged: (bool? newBool) {
                                          setState(() {
                                            checkboxValues[index] =
                                                newBool ?? false;
                                          });
                                        },
                                      ),
                                      title: TextField(
                                        style: TextStyle(color: Colors.white),
                                        decoration: InputDecoration(
                                            border: InputBorder.none,
                                            hintText: "Task add",
                                            hintStyle: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 17,
                                            ),
                                            contentPadding: EdgeInsets.only(
                                                left: 20, right: 20)),
                                        onChanged: (value) {
                                          myTasks[index] = value;
                                        },
                                      ),
                                      trailing: IconButton(
                                          onPressed: () {
                                            setState(() {
                                              deleteItem(index);
                                            });
                                          },
                                          icon: Icon(
                                            Icons.delete,
                                            color: Colors.white,
                                          )),
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
                            Icon(Icons.calendar_month,
                                color: ColorConstants.iconColor),
                            SizedBox(width: 10),
                            Text("", style: headingStyle),
                          ],
                        ),
                        SizedBox(height: 20),
                        Row(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Start Time', style: normalTextStyle16),
                                SizedBox(height: 10),
                                Row(
                                  children: [
                                    Icon(Icons.timelapse,
                                        color: ColorConstants.iconColor),
                                    SizedBox(width: 10),
                                    Text("", style: headingStyle),
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
                                    Text("", style: headingStyle),
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
                                Text("", style: headingStyle),
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
        ));
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
