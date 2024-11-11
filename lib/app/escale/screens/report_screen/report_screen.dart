import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:basic/app/themes/app_colors.dart';
import 'package:basic/app/themes/edge_insets.dart';
import 'package:basic/app/themes/fonts.dart';

import '../../../core/widgets/app_scaffold.dart';
import 'report_screen_controller.dart';
import 'report_screen_cubit.dart';

import 'package:basic/app/core/widgets/base_stateless_widget.dart';

class ReportScreen
    extends BaseStatelessWidget<ReportScreenController,
        ReportScreenCubit,
        ReportScreenState> {

  ReportScreen({Key? key, super.controller, super.onStateChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ReportScreenCubit>(
      create: (context) => createCubitAndAssignToController(context),
      child: BlocConsumer<ReportScreenCubit, ReportScreenState>(
        listener: (context, state) {
          if (onStateChanged != null) {
            onStateChanged!(state);
          }
        },
        builder: (context, state) {
          initializeController(context);
          return AppScaffold(
            appBarTitle: Text("Reports"),
            body: Center(
              child: Text("report screen"),
            ),
          );
        },
      ),
    );
  }

  @override
  ReportScreenCubit createCubitAndAssignToController(BuildContext context) {
    ReportScreenCubit cubit = ReportScreenCubit(context: context);
    controller?.cubit = cubit;
    controller?.childContext = context;
    return cubit;
  }

}
