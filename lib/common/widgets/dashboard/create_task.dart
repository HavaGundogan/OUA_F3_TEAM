import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:yourself_in_time_project/common/constants/app_colors.dart';
import 'package:yourself_in_time_project/common/values/spacing.dart';
import 'package:yourself_in_time_project/common/widgets/add_sub_icon.dart';
import 'package:yourself_in_time_project/common/widgets/bottom_sheets/bottom_sheet_holder.dart';
import 'package:yourself_in_time_project/common/widgets/dashboard/sheet_goto_calendar_widget.dart';
import 'package:yourself_in_time_project/common/widgets/forms/form_input_unlabelled_form_input.dart';
import 'package:yourself_in_time_project/core/utils/utils.dart';
import 'package:yourself_in_time_project/ui/home/home_view.dart';
import 'package:yourself_in_time_project/ui/programming/programming_view.dart';
import 'package:yourself_in_time_project/ui/programming/programming_view_model.dart';

// ignore: must_be_immutable
class CreateTaskBottomSheet extends StatelessWidget {
  CreateTaskBottomSheet({Key? key}) : super(key: key);

  TextEditingController _taskNameController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        AppSpaces.verticalSpace10,
        BottomSheetHolder(),
        AppSpaces.verticalSpace10,
        Padding(
          padding: EdgeInsets.all(20),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(children: [
              Icon(Icons.category, color: Colors.white),
              AppSpaces.horizontalSpace10,
              Text("Category  ",
                  style: GoogleFonts.lato(
                      color: Colors.white, fontWeight: FontWeight.w700)),
              Icon(Icons.expand_more, color: Colors.white),
            ]),
            AppSpaces.verticalSpace20,
            Row(
              children: [
                Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        gradient: LinearGradient(colors: [
                          HexColor.fromHex("FD916E"),
                          HexColor.fromHex("FFE09B")
                        ]))),
                AppSpaces.horizontalSpace20,
                Expanded(
                  child: UnlabelledFormInput(
                    placeholder: "Task Name ....",
                    autofocus: true,
                    keyboardType: "text",
                    controller: _taskNameController,
                    obscureText: false,
                  ),
                ),
              ],
            ),
            AppSpaces.verticalSpace20,
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              SheetGoToCalendarWidget(
                cardBackgroundColor: HexColor.fromHex("7DBA67"),
                textAccentColor: HexColor.fromHex("A9F49C"),
                value: 'Today 3:00PM',
                label: 'Start Date',
              ),
              SheetGoToCalendarWidget(
                cardBackgroundColor: Colors.red,
                textAccentColor: Colors.red,
                value: 'Today 3:00PM',
                label: 'End Date',
              )
            ]),
            // Spacer(),
            AppSpaces.verticalSpace20,

            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Container(
                width: Utils.screenWidth * 0.4,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BottomSheetIcon(icon: Icons.audio_file),
                      Transform.rotate(
                          angle: 195.2,
                          child: BottomSheetIcon(icon: Icons.attach_file)),
                      BottomSheetIcon(icon: FeatherIcons.image)
                    ]),
              ),
              AddSubIcon(
                scale: 0.8,
                color: Colors.green,
                ontap: _addProject,
              ),
            ])
          ]),
        ),
      ]),
    );
  }

  void _addProject() {
    Get.to(() => ProgrammingView());
  }
}

class BottomSheetIcon extends StatelessWidget {
  final IconData icon;
  const BottomSheetIcon({
    required this.icon,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        icon,
        color: Colors.white,
      ),
      iconSize: 32,
      onPressed: null,
    );
  }
}
