import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:yourself_in_time_project/common/constants/assets_path_constants.dart';
import 'package:yourself_in_time_project/common/constants/colors_constants.dart';
import 'package:yourself_in_time_project/common/helpers/circle_create_helper.dart';
import 'package:yourself_in_time_project/common/widgets/background_widget.dart';
import 'package:yourself_in_time_project/common/widgets/loginViewPosition_widget.dart';
import 'package:yourself_in_time_project/core/di/get_it.dart';
import 'package:yourself_in_time_project/ui/login/login_view_model.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return ViewModelBuilder<LoginViewModel>.reactive(
        viewModelBuilder: () => getIt<LoginViewModel>(),
        disposeViewModel: false,
        builder: (context, model, child) => Scaffold(
              resizeToAvoidBottomInset: false,
              backgroundColor: ColorConstants.greyColorShade,
              body: Stack(children: <Widget>[
                buildJsonAsset(
                  size,
                  AssetsPathConstants.workingJsonPath,
                  20,
                  0,
                ),
                BackgroundWidget(),
                getLightBlueCircle(context),
                buildWidget(context, model),
              ]),
            ));
  }
}
