import 'package:flutter/material.dart';
import 'package:yourself_in_time_project/common/constants/colors_constants.dart';
import 'package:yourself_in_time_project/common/values/theme.dart';
import 'package:yourself_in_time_project/core/services/auth_service.dart';

class TaskDetailPage extends StatefulWidget {
  final bool? shouldShowEdit;

  TaskDetailPage({super.key, this.shouldShowEdit});

  @override
  State<TaskDetailPage> createState() => _TaskDetailPageState();
}

class _TaskDetailPageState extends State<TaskDetailPage> {
  AuthService? _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: Padding(
        padding: const EdgeInsets.only(left: 24.0, right: 24.0),
        child: Column(
          children: [
            SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
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
