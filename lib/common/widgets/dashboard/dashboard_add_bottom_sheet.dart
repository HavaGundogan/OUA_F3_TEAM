import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yourself_in_time_project/common/bottomSheets/bottom_sheets.dart';
import 'package:yourself_in_time_project/common/values/spacing.dart';
import 'package:yourself_in_time_project/common/widgets/Dashboard/create_task.dart';
import 'package:yourself_in_time_project/common/widgets/bottom_sheets/bottom_sheet_holder.dart';
import 'package:yourself_in_time_project/common/widgets/onboarding/labelled_option.dart';
import 'package:yourself_in_time_project/ui/task/task_due_date.dart';

class DashboardAddBottomSheet extends StatelessWidget {
  const DashboardAddBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      AppSpaces.verticalSpace10,
      BottomSheetHolder(),
      AppSpaces.verticalSpace10,
      LabelledOption(
        label: 'Create Task',
        icon: Icons.add_to_queue,
        callback: _createTask,
      ),
      LabelledOption(
          label: 'Create Series',
          icon: Icons.rocket,
          callback: () {
            Get.to(() => TaskDueDate());
          }),
    ]);
  }

  void _createTask() {
    showAppBottomSheet(
      CreateTaskBottomSheet(),
      isScrollControlled: true,
      popAndShow: true,
    );
  }
}
