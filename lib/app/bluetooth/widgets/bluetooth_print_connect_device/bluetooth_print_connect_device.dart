import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:basic/app/themes/borders.dart';
import 'package:basic/app/themes/edge_insets.dart';
import 'package:go_router/go_router.dart';

import 'bluetooth_print_connect_device_controller.dart';
import 'bluetooth_print_connect_device_cubit.dart';

import '/app/core/widgets/base_stateless_widget.dart';

class BluetoothPrintConnectDevice
    extends BaseStatelessWidget<
        BluetoothPrintConnectDeviceController,
        BluetoothPrintConnectDeviceCubit,
        BluetoothPrintConnectDeviceState> {

  const BluetoothPrintConnectDevice(
      {Key? key, super.controller, super.onStateChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<BluetoothPrintConnectDeviceCubit>(
      create: (context) => createCubitAndAssignToController(context),
      child: BlocConsumer<
          BluetoothPrintConnectDeviceCubit,
          BluetoothPrintConnectDeviceState>(
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
  BluetoothPrintConnectDeviceCubit createCubitAndAssignToController(
      BuildContext context) {
    BluetoothPrintConnectDeviceCubit cubit = BluetoothPrintConnectDeviceCubit(
        context: context);
    controller?.cubit = cubit;
    controller?.childContext = context;
    return cubit;
  }

}
