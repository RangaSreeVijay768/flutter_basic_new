import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import '/app/themes/borders.dart';
import '/app/themes/edge_insets.dart';
import 'package:go_router/go_router.dart';

import 'sell_template_scale_widget_controller.dart';
import 'sell_template_scale_widget_cubit.dart';

import '/app/core/widgets/base_stateless_widget.dart';

class SellTemplateScaleWidget extends BaseStatelessWidget<
    SellTemplateScaleWidgetController,
    SellTemplateScaleWidgetCubit,
    SellTemplateScaleWidgetState> {
  SellTemplateScaleWidget({Key? key, super.controller, super.onStateChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SellTemplateScaleWidgetCubit>(
      create: (context) => createCubitAndAssignToController(context),
      child: BlocConsumer<SellTemplateScaleWidgetCubit,
          SellTemplateScaleWidgetState>(
        listener: (context, state) {
          if (onStateChanged != null) {
            onStateChanged!(state);
          }
        },
        builder: (context, state) {
          initializeController(context);
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Status: ${state.status}", style: TextStyle(fontSize: 18)),
              SizedBox(height: 20),
              Text("Weight: ${state.weight}",
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
              Text("Rounded Weight: ${state.weight.substring(0, 2)}",
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
            ],
          );
        },
      ),
    );
  }

  @override
  SellTemplateScaleWidgetCubit createCubitAndAssignToController(
      BuildContext context) {
    SellTemplateScaleWidgetCubit cubit =
        SellTemplateScaleWidgetCubit(context: context);
    controller?.cubit = cubit;
    controller?.childContext = context;
    return cubit;
  }
}

class EscaleWidget extends SellTemplateScaleWidget {
  EscaleWidget({Key? key, super.controller, super.onStateChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SellTemplateScaleWidgetCubit>(
      create: (context) => createCubitAndAssignToController(context),
      child: BlocConsumer<SellTemplateScaleWidgetCubit,
          SellTemplateScaleWidgetState>(
        listener: (context, state) {
          if (onStateChanged != null) {
            onStateChanged!(state);
          }
        },
        builder: (context, state) {
          initializeController(context);
          return Text(state.weight.substring(0, 2),
              style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold
              ));
        },
      ),
    );
  }
}
