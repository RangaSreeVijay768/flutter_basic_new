import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:basic/app/themes/app_colors.dart';
import 'package:basic/app/themes/edge_insets.dart';
import 'package:basic/app/themes/fonts.dart';

import '../../../core/widgets/app_scaffold.dart';
import 'setting_screen_controller.dart';
import 'setting_screen_cubit.dart';

import 'package:basic/app/core/widgets/base_stateless_widget.dart';

class SettingScreen
    extends BaseStatelessWidget<SettingScreenController,
        SettingScreenCubit,
        SettingScreenState> {

  SettingScreen({Key? key, super.controller, super.onStateChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SettingScreenCubit>(
      create: (context) => createCubitAndAssignToController(context),
      child: BlocConsumer<SettingScreenCubit, SettingScreenState>(
        listener: (context, state) {
          if (onStateChanged != null) {
            onStateChanged!(state);
          }
        },
        builder: (context, state) {
          initializeController(context);
          return AppScaffold(
            appBarTitle: Text("Settings"),
            body: Center(
              child: Text("setting screen"),
            ),
          );
        },
      ),
    );
  }

  @override
  SettingScreenCubit createCubitAndAssignToController(BuildContext context) {
    SettingScreenCubit cubit = SettingScreenCubit(context: context);
    controller?.cubit = cubit;
    controller?.childContext = context;
    return cubit;
  }

}
