import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import '/app/themes/borders.dart';
import '/app/themes/edge_insets.dart';
import 'package:go_router/go_router.dart';

import 'bluetooth_auto_connect_device_controller.dart';
import 'bluetooth_auto_connect_device_cubit.dart';

import '/app/core/widgets/base_stateless_widget.dart';

class BluetoothAutoConnectDevice
    extends BaseStatelessWidget<
        BluetoothAutoConnectDeviceController,
        BluetoothAutoConnectDeviceCubit,
        BluetoothAutoConnectDeviceState> {

  BluetoothAutoConnectDevice({Key? key, super.controller, super.onStateChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<BluetoothAutoConnectDeviceCubit>(
      create: (context) => createCubitAndAssignToController(context),
      child: BlocConsumer<
          BluetoothAutoConnectDeviceCubit,
          BluetoothAutoConnectDeviceState>(
        listener: (context, state) {
          if (onStateChanged != null) {
            onStateChanged!(state);
          }
        },
        builder: (context, state) {
          initializeController(context);
          return Container();
        },
      ),
    );
  }

  @override
  BluetoothAutoConnectDeviceCubit createCubitAndAssignToController(
      BuildContext context) {
    BluetoothAutoConnectDeviceCubit cubit = BluetoothAutoConnectDeviceCubit(
        context: context);
    controller?.cubit = cubit;
    controller?.childContext = context;
    return cubit;
  }

}
