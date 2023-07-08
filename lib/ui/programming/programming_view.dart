// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'package:yourself_in_time_project/core/di/get_it.dart';
import 'package:yourself_in_time_project/ui/programming/programming_view_model.dart';

class ProgrammingView extends StatelessWidget {
  const ProgrammingView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ProgrammingViewModel>.reactive(
        viewModelBuilder: () => getIt<ProgrammingViewModel>(),
        disposeViewModel: false,
        builder: (context, model, child) => Scaffold());
  }
}
