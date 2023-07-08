import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yourself_in_time_project/common/constants/app_colors.dart';

class TaskezBottomSheet {
  // static const MethodChannel _channel = MethodChannel('taskezBottomSheet');
}

showAppBottomSheet(Widget widget,
    {bool isScrollControlled = false,
    bool popAndShow = false,
    double? height}) {
  if (popAndShow) Get.back();
  return Get.bottomSheet(
      height == null ? widget : Container(height: height, child: widget),
      backgroundColor: AppColors.primaryBackgroundColor, // add butonunun rengi
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      isScrollControlled: isScrollControlled);
}
