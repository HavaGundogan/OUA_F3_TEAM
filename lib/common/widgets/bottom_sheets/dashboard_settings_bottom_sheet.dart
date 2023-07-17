import 'package:flutter/material.dart';
import 'package:yourself_in_time_project/common/values/spacing.dart';
import 'package:yourself_in_time_project/common/widgets/Buttons/primary_buttons.dart';
import 'package:yourself_in_time_project/common/widgets/Buttons/text_button.dart';
import 'package:yourself_in_time_project/common/widgets/Onboarding/toggle_option.dart';
import 'package:yourself_in_time_project/common/widgets/bottom_sheets/bottom_sheet_holder.dart';

class DashboardSettingsBottomSheet extends StatelessWidget {
  final ValueNotifier<bool> totalTaskNotifier;
  final ValueNotifier<bool> totalDueNotifier;
  final ValueNotifier<bool> totalCompletedNotifier;
  final ValueNotifier<bool> workingOnNotifier;
  const DashboardSettingsBottomSheet(
      {Key? key,
      required this.totalTaskNotifier,
      required this.totalDueNotifier,
      required this.totalCompletedNotifier,
      required this.workingOnNotifier})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      AppSpaces.verticalSpace10,
      BottomSheetHolder(),
      AppSpaces.verticalSpace20,
      ToggleLabelOption(
          label: '    notification',
          notifierValue: totalTaskNotifier,
          icon: Icons.notifications_active),
      ToggleLabelOption(
          label: '    Enlarge',
          notifierValue: totalDueNotifier,
          icon: Icons.text_fields),
      ToggleLabelOption(
          label: '    Completed',
          notifierValue: totalCompletedNotifier,
          icon: Icons.check_circle),
      Spacer(),
      Padding(
        padding: EdgeInsets.only(right: 20.0, left: 20.0, bottom: 20.0),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          AppTextButton(
            buttonText: 'Clear All',
            buttonSize: 16,
          ),
          AppPrimaryButton(
            buttonHeight: 60,
            buttonWidth: 160,
            buttonText: "Save Changes",
          )
        ]),
      )
    ]);
  }
}
