import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:stacked/stacked.dart';
import 'package:yourself_in_time_project/common/constants/assets_path_constants.dart';
import 'package:yourself_in_time_project/common/constants/colors_constants.dart';
import 'package:yourself_in_time_project/common/helpers/circle_create_helper.dart';
import 'package:yourself_in_time_project/common/helpers/text_editing_form_field_helper.dart';
import 'package:yourself_in_time_project/common/widgets/background_widget.dart';
import 'package:yourself_in_time_project/common/widgets/loginViewPosition_widget.dart';
import 'package:yourself_in_time_project/common/widgets/register_field_widget.dart';
import 'package:yourself_in_time_project/core/di/get_it.dart';
import 'package:yourself_in_time_project/ui/register/register_view_model.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  TextEditingControllerHelper textEditingControllerHelper =
      TextEditingControllerHelper();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return ViewModelBuilder<RegisterViewModel>.reactive(
        viewModelBuilder: () => getIt<RegisterViewModel>(),
        disposeViewModel: false,
        builder: (context, model, child) => Scaffold(
            backgroundColor: ColorConstants.greyColorShade,
            body: Stack(children: <Widget>[
              buildJsonAsset(
                size,
                AssetsPathConstants.welcomeJsonPath,
                -20,
                -10,
              ),
              BackgroundWidget(),
              getLightBlueCircle(context),
              buildRegister(model, textEditingControllerHelper)
            ])));
  }

  Positioned buildRegister(
      RegisterViewModel model, TextEditingControllerHelper controllerHelper) {
    return Positioned(
      top: 70,
      left: 0,
      right: 0,
      child: RegisterFieldWidget(
        model: model,
      ),
    );
  }
}
