// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';
import 'package:yourself_in_time_project/common/constants/colors_constants.dart';
import 'package:yourself_in_time_project/common/values/theme.dart';
import 'package:yourself_in_time_project/common/widgets/dashboard/bottom_navigation_item.dart';

import 'package:yourself_in_time_project/core/di/get_it.dart';
import 'package:yourself_in_time_project/ui/dashboard/dashboard.dart';
import 'package:yourself_in_time_project/ui/programming/programming_view_model.dart';

import '../../common/widgets/dashboard/dashboard_add_button.dart';

class ProgrammingView extends StatefulWidget {
  const ProgrammingView({
    Key? key,
  }) : super(key: key);

  @override
  State<ProgrammingView> createState() => _ProgrammingViewState();
}

class _ProgrammingViewState extends State<ProgrammingView> {
  String _selectedTime = '';
  String _selecteddTime = '';
//******************************* */

  List<bool> isTaskCompletes = [];
  List<TextEditingController> _textFieldControllers = [];
  TextEditingController _titleController = TextEditingController();
  TextEditingController _descController = TextEditingController();
  String taskState = "";
  String category = "";
  int boardId = 0;

  bool isCompleted = false;
  String taskStatusUpdate = "";

  List<String> dataList = [];

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ProgrammingViewModel>.reactive(
        viewModelBuilder: () => getIt<ProgrammingViewModel>(),
        disposeViewModel: false,
        builder: (context, model, child) => Scaffold(
              body: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                  Color(0xff1d1e26),
                  Color(0xff252041),
                ])),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      IconButton(
                          onPressed: () {
                            Get.back();
                          },
                          icon: Icon(
                            CupertinoIcons.arrow_left,
                            color: Colors.white,
                            size: 28,
                          )),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 25, vertical: 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Create",
                              style: GoogleFonts.ubuntu(
                                  fontSize: 33,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 4),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              "New Todo",
                              style: GoogleFonts.ubuntu(
                                  fontSize: 33,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 2),
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            label("Task Title"),
                            SizedBox(
                              height: 12,
                            ),
                            title(),
                            SizedBox(
                              height: 12,
                            ),
                            label("Task Type"),
                            SizedBox(
                              height: 12,
                            ),
                            Row(
                              children: [
                                taskSelect("Important", 0XFF2664FA),
                                SizedBox(
                                  width: 20,
                                ),
                                taskSelect("Planned", 0xff2bc8d9)
                              ],
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            label("Task Add"),
                            SizedBox(
                              height: 12,
                            ),
                            taskAdd(),
                            SizedBox(
                              height: 25,
                            ),
                            label("Descreption"),
                            SizedBox(
                              height: 12,
                            ),
                            descreption(),
                            SizedBox(
                              height: 12,
                            ),
                            Row(
                              children: [
                                inputField(),
                                SizedBox(
                                  width: 10,
                                ),
                                inputFieldd(),
                              ],
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            label("Category"),
                            SizedBox(
                              height: 12,
                            ),
                            Wrap(
                              runSpacing: 10,
                              children: [
                                categorySelect("Food", 0xffff6d6e),
                                SizedBox(
                                  width: 20,
                                ),
                                categorySelect("WorkOut", 0xfff29732),
                                SizedBox(
                                  width: 20,
                                ),
                                categorySelect("Work", 0xff6557ff),
                                SizedBox(
                                  width: 20,
                                ),
                                categorySelect("Design", 0xff234ebd),
                                SizedBox(
                                  width: 20,
                                ),
                                categorySelect("Run", 0xff2bc8d9),
                              ],
                            ),
                            SizedBox(
                              height: 50,
                            ),
                            button(model),
                            SizedBox(
                              height: 30,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ));
  }

  Widget inputField() {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Start Time",
              style: inputLabelTextStyle,
            ),
            Container(
              margin: EdgeInsets.only(top: 8),
              padding: EdgeInsets.all(8),
              height: 60,
              decoration: BoxDecoration(
                border: Border.all(
                    color: ColorConstants.buttonColor.withOpacity(0.4)),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      style: TextStyle(color: Colors.grey),
                      readOnly: true,
                      controller: TextEditingController(
                        text: "${_selectedTime} PM",
                      ),
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          icon: Icon(Icons.access_time),
                          color: Colors.white,
                          onPressed: () {
                            _showTimePicker(context);
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget inputFieldd() {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("End Time", style: inputLabelTextStyle),
            Container(
              margin: EdgeInsets.only(top: 8),
              padding: EdgeInsets.all(8),
              height: 60,
              decoration: BoxDecoration(
                border: Border.all(
                    color: ColorConstants.buttonColor.withOpacity(0.4)),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      style: TextStyle(color: Colors.grey),
                      readOnly: true,
                      controller:
                          TextEditingController(text: "${_selecteddTime} PM"),
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          icon: Icon(Icons.access_time),
                          color: Colors.white,
                          onPressed: () {
                            _showTimeePicker(context);
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showTimePicker(BuildContext context) {
    DatePicker.showTimePicker(
      context,
      showTitleActions: true,
      onConfirm: (time) {
        setState(() {
          _selectedTime = '${time.hour}:${time.minute}';
        });
      },
    );
  }

  void _showTimeePicker(BuildContext context) {
    DatePicker.showTimePicker(
      context,
      showTitleActions: true,
      onConfirm: (time) {
        setState(() {
          _selecteddTime = '${time.hour}:${time.minute}';
        });
      },
    );
  }

  Widget taskAdd() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 110,
                height: 40,
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll(Colors.lightGreen),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)))),
                  onPressed: () {
                    setState(() {
                      dataList.add('');
                    });
                  },
                  child: Text(
                    "Add",
                    style:
                        GoogleFonts.ubuntu(color: Colors.white, fontSize: 15),
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "Please click the button to add a task !!",
                style: GoogleFonts.ubuntu(color: Colors.white, fontSize: 12),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: dataList.length,
            itemBuilder: (context, index) {
              if (index >= _textFieldControllers.length) {
                _textFieldControllers.add(TextEditingController());
                isTaskCompletes.add(false);
              }

              return Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      top: 10,
                    ),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Color(0xff2a2e3d),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: ListTile(
                      leading: Icon(
                        CupertinoIcons.pencil,
                        color: Colors.white,
                      ),
                      title: TextField(
                        controller: _textFieldControllers[index],
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Task add",
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 17,
                            ),
                            contentPadding:
                                EdgeInsets.only(left: 20, right: 20)),
                        onChanged: (value) {
                          setState(() {
                            if (index < dataList.length) {
                              dataList[index] = value;
                            }
                          });
                        },
                      ),
                      trailing: IconButton(
                          onPressed: () {
                            setState(() {
                              deleteItem(index);
                              if (index < dataList.length) {
                                dataList.removeAt(index);
                              }
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
            },
          )
        ],
      ),
    );
  }

  void _addTextField() {
    TextEditingController newController = TextEditingController();
    _textFieldControllers.add(newController);
    dataList.add('');

    setState(() {}); // Widget yeniden çizilsin
  }

  void deleteItem(int index) {
    _textFieldControllers[index].dispose();
    _textFieldControllers.removeAt(index);
  }

  void dispose() {
    for (var controller in _textFieldControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  Widget button(ProgrammingViewModel model) {
    return InkWell(
      onTap: () {
        FirebaseFirestore.instance.collection("tasks").add({
          "title": _titleController.text,
          "description": _descController.text,
          "board_id": boardId,
          "category": category,
          "end_date": _selecteddTime,
          "is_completed": isCompleted,
          "my_task": dataList,
          "is_task_complete": isTaskCompletes,
          "start_date": _selectedTime,
          "task_state": taskState,
          "task_status_update_on": taskStatusUpdate
        });
        model.complete();
      },
      child: Container(
        height: 56,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient:
                LinearGradient(colors: [Color(0xff8a32f1), Color(0xffad32f9)])),
        child: Center(
          child: Text(
            "Add Todo",
            style: GoogleFonts.ubuntu(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }

  Widget descreption() {
    return Container(
      height: 150,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Color(0xff2a2e3d),
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextFormField(
        controller: _descController,
        style: TextStyle(
          color: Colors.grey,
          fontSize: 17,
        ),
        maxLines: null,
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: "Please subscribe this channel",
            hintStyle: TextStyle(
              color: Colors.grey,
              fontSize: 17,
            ),
            contentPadding: EdgeInsets.only(left: 20, right: 20)),
      ),
    );
  }

  Widget taskSelect(String label, int color) {
    return InkWell(
      onTap: () {
        setState(() {
          taskState = label;
        });
      },
      child: Chip(
        backgroundColor: taskState == label ? Colors.white : Color(color),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        label: Text(label,
            style: GoogleFonts.ubuntu(
              color: taskState == label ? Colors.black : Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.w600,
            )),
        labelPadding: EdgeInsets.symmetric(horizontal: 17, vertical: 3.8),
      ),
    );
  }

  Widget categorySelect(String label, int color) {
    return InkWell(
      onTap: () {
        setState(() {
          category = label;
        });
      },
      child: Chip(
        backgroundColor: category == label ? Colors.white : Color(color),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        label: Text(label,
            style: GoogleFonts.ubuntu(
              color: category == label ? Colors.black : Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.w600,
            )),
        labelPadding: EdgeInsets.symmetric(horizontal: 17, vertical: 3.8),
      ),
    );
  }

  Widget title() {
    return Container(
      height: 55,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Color(0xff2a2e3d),
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextFormField(
        controller: _titleController,
        style: TextStyle(
          color: Colors.grey,
          fontSize: 17,
        ),
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: "Task Title",
            hintStyle: TextStyle(
              color: Colors.grey,
              fontSize: 17,
            ),
            contentPadding: EdgeInsets.only(left: 20, right: 20)),
      ),
    );
  }

  Widget label(String label) {
    return Text(
      label,
      style: GoogleFonts.ubuntu(
          fontSize: 16.5,
          color: Colors.white,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.2),
    );
  }
}
