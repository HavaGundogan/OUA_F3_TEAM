// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';

import 'package:yourself_in_time_project/common/constants/colors_constants.dart';
import 'package:yourself_in_time_project/common/values/theme.dart';
import 'package:yourself_in_time_project/common/widgets/task_tile_new.dart';
import 'package:yourself_in_time_project/core/di/get_it.dart';
import 'package:yourself_in_time_project/core/services/auth_service.dart';
import 'package:yourself_in_time_project/ui/main/main_view_model.dart';

class MainView extends StatefulWidget {
  const MainView({
    Key? key,
  }) : super(key: key);

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int isCompleted = 0;
  AuthService _authService = AuthService();
  DateTime selectedDate = DateTime.now();
  bool showCount = false;
  int todoCount = 0, completedCount = 0;

  var tasks = [];

  @override
  void initState() {
    super.initState();
    fetchTitleData();
  }

  void fetchTitleData() async {
    List<Map<String, dynamic>>? fetchedtasks = await _authService.getAll();
    setState(() {
      tasks = fetchedtasks;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MainViewModel>.reactive(
      viewModelBuilder: () => getIt<MainViewModel>(),
      disposeViewModel: false,
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildText(),
              SizedBox(
                height: 20,
              ),
              buildTalk(context),
              taskTitle(),
              SizedBox(
                height: 20,
              ),
              showTask(model)
            ],
          ),
        ),
      ),
    );
  }

  Widget showTask(dynamic model) {
    return Expanded(
        child: ListView.builder(
            itemCount: tasks.length,
            itemBuilder: (context, index) {
              return AnimationConfiguration.staggeredList(
                  position: index,
                  child: GestureDetector(
                    onTap: () {},
                    child: TaskTileNew(
                        index: index,
                        shouldShowCompleteStatus: true,
                        model: model,
                        onDelete: () {
                          setState(() {
                            tasks.removeAt(index);
                          });
                        }),
                  ));
            }));
  }

  showBottomSheet({required builder, required BuildContext context}) {
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
                onTap: () async {}),
            bottomSheetButton(
                context: context,
                label: "Mark as Complete",
                color: ColorConstants.buttonColor,
                onTap: () {}),
            bottomSheetButton(
                context: context,
                label: "Delete Task",
                color: ColorConstants.buttonColor,
                onTap: () {}),
            bottomSheetButton(
                context: context,
                label: "Close",
                color: Colors.white,
                onTap: () {
                  Get.back();
                },
                isClose: true),
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
          style: TextStyle(
              color: isClose
                  ? Get.isDarkMode
                      ? Colors.white
                      : Colors.black
                  : Colors.white),
        )),
      ),
    );
  }

  Widget buildText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Hi ", style: boldHeadingTextStyle),
            SizedBox(height: 10),
            Text(
              "Today - ${DateFormat.yMMMMd().format(DateTime.now())}",
              style: subHeadingStyle,
            ),
          ],
        )
      ],
    );
  }

  Widget buildTalk(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 10,
      ),
      child: Card(
        color: ColorConstants.buttonColor.withOpacity(0.1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 0,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Don't talk about what you have done or what you are going to do.",
                textAlign: TextAlign.justify,
                style: quotesTextStyle,
              ),
              SizedBox(height: 10),
              Align(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    "Thomas Jefferson",
                    textAlign: TextAlign.justify,
                    style: quotesTextStyle,
                  ))
            ],
          ),
        ),
      ),
    );
  }

  Widget taskTitle() {
    return Container(
      margin: EdgeInsets.all(16),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text("Today's Task", style: toolbarTitleStyle),
        ]),
        GestureDetector(
          onTap: () async {},
          child: Text(
            'View All Tasks',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: ColorConstants.buttonColor,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ]),
    );
  }
}
