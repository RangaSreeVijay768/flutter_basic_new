import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:basic/app/themes/borders.dart';
import 'package:basic/app/themes/edge_insets.dart';
import 'package:go_router/go_router.dart';

import '../../../core/database/boolean_status.dart';
import 'bluetooth_print_disconnect_device_controller.dart';
import 'bluetooth_print_disconnect_device_cubit.dart';

import '/app/core/widgets/base_stateless_widget.dart';

class BluetoothPrintDisconnectDevice extends BaseStatelessWidget<
    BluetoothPrintDisconnectDeviceController,
    BluetoothPrintDisconnectDeviceCubit,
    BluetoothPrintDisconnectDeviceState> {
  BluetoothPrintDisconnectDevice(
      {Key? key, super.controller, super.onStateChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<BluetoothPrintDisconnectDeviceCubit>(
      create: (context) => createCubitAndAssignToController(context),
      child: BlocConsumer<BluetoothPrintDisconnectDeviceCubit,
          BluetoothPrintDisconnectDeviceState>(
        listener: (context, state) {
          if (onStateChanged != null) {
            onStateChanged!(state);
          }
        },
        builder: (context, state) {
          initializeController(context);
          return TextButton(
              onPressed: (state.bluetoothPrintDisconnectDeviceStatus ==
                      BooleanStatus.pending)
                  ? null
                  : () async {
                      await getCubit(context).disconnectDevice(
                          getCubit(context).createRequestData());
                    },
              child: const Text("Disconnect"));
        },
      ),
    );
  }

  @override
  BluetoothPrintDisconnectDeviceCubit createCubitAndAssignToController(
      BuildContext context) {
    BluetoothPrintDisconnectDeviceCubit cubit =
        BluetoothPrintDisconnectDeviceCubit(context: context);
    controller?.cubit = cubit;
    controller?.childContext = context;
    return cubit;
  }
}
