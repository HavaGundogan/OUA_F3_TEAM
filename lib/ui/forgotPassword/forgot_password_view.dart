import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:yourself_in_time_project/common/constants/assets_path_constants.dart';
import 'package:yourself_in_time_project/common/constants/colors_constants.dart';
import 'package:yourself_in_time_project/common/helpers/circle_create_helper.dart';
import 'package:yourself_in_time_project/common/widgets/background_widget.dart';
import 'package:yourself_in_time_project/common/widgets/forgot_widget.dart';
import 'package:yourself_in_time_project/common/widgets/loginViewPosition_widget.dart';
import 'package:yourself_in_time_project/core/di/get_it.dart';
import 'package:yourself_in_time_project/ui/forgotPassword/forgot_password_view_model.dart';

class ForgotPasswordView extends StatefulWidget {
  const ForgotPasswordView({super.key});

  @override
  State<ForgotPasswordView> createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPasswordView> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return ViewModelBuilder<FargotPasswordViewModel>.reactive(
        viewModelBuilder: () => getIt<FargotPasswordViewModel>(),
        disposeViewModel: false,
        builder: (context, model, child) => Scaffold(
              backgroundColor: ColorConstants.greyColorShade,
              body: Stack(
                children: <Widget>[
                  buildJsonAsset(
                      size, AssetsPathConstants.thinkJsonPath, 0, -10),
                  BackgroundWidget(),
                  getLightBlueCircle(context),
                  buildForgotWidget(model, context),
                ],
              ),
            ));
  }
}
