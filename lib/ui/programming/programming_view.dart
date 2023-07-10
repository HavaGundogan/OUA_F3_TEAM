// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';

import 'package:yourself_in_time_project/core/di/get_it.dart';
import 'package:yourself_in_time_project/ui/programming/programming_view_model.dart';

class ProgrammingView extends StatefulWidget {
  const ProgrammingView({
    Key? key,
  }) : super(key: key);

  @override
  State<ProgrammingView> createState() => _ProgrammingViewState();
}

class _ProgrammingViewState extends State<ProgrammingView> {
  List<String> dataList = [];

  void deleteItem(int index) {
    dataList.removeAt(index);
  }

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
                          onPressed: () {},
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
                                chipData("Important", 0XFF2664FA),
                                SizedBox(
                                  width: 20,
                                ),
                                chipData("Planned", 0xff2bc8d9)
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
                            label("Category"),
                            SizedBox(
                              height: 12,
                            ),
                            Wrap(
                              runSpacing: 10,
                              children: [
                                chipData("Food", 0xffff6d6e),
                                SizedBox(
                                  width: 20,
                                ),
                                chipData("WorkOut", 0xfff29732),
                                SizedBox(
                                  width: 20,
                                ),
                                chipData("Work", 0xff6557ff),
                                SizedBox(
                                  width: 20,
                                ),
                                chipData("Design", 0xff234ebd),
                                SizedBox(
                                  width: 20,
                                ),
                                chipData("Run", 0xff2bc8d9),
                              ],
                            ),
                            SizedBox(
                              height: 50,
                            ),
                            button(),
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
                          dataList[index] = value;
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
            },
          )
        ],
      ),
    );
  }

  Widget button() {
    return Container(
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
        style: TextStyle(
          color: Colors.grey,
          fontSize: 17,
        ),
        maxLines: null,
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: "Descreption",
            hintStyle: TextStyle(
              color: Colors.grey,
              fontSize: 17,
            ),
            contentPadding: EdgeInsets.only(left: 20, right: 20)),
      ),
    );
  }

  Widget chipData(String label, int color) {
    return Chip(
      backgroundColor: Color(color),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      label: Text(label,
          style: GoogleFonts.ubuntu(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.w600,
          )),
      labelPadding: EdgeInsets.symmetric(horizontal: 17, vertical: 3.8),
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
