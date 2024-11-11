import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:basic/app/bluetooth/state/bluetooth_cubit.dart';
import 'package:basic/app/bluetooth/widgets/bluetooth_print_connect_device/bluetooth_print_connect_device_controller.dart';
import 'package:basic/app/bluetooth/widgets/bluetooth_print_print_receipt/bluetooth_print_print_receipt_controller.dart';
import 'package:basic/app/themes/edge_insets.dart';

import '/app/core/widgets/base_stateless_widget.dart';
import '../bluetooth_print_bluetooth_devices/bluetooth_print_bluetooth_devices.dart';
import '../bluetooth_print_disconnect_device/bluetooth_print_disconnect_device_controller.dart';
import 'bluetooth_print_start_scan_controller.dart';
import 'bluetooth_print_start_scan_cubit.dart';

class BluetoothPrintStartScan extends BaseStatelessWidget<
    BluetoothPrintStartScanController,
    BluetoothPrintStartScanCubit,
    BluetoothPrintStartScanState> {
  BluetoothPrintStartScan({
    Key? key,
    super.controller,
    super.onStateChanged,
  }) : super(key: key);
  BluetoothPrintConnectDeviceController bluetoothPrintConnectDeviceController =
      BluetoothPrintConnectDeviceController();
  BluetoothPrintDisconnectDeviceController
      bluetoothPrintDisconnectDeviceController =
      BluetoothPrintDisconnectDeviceController();
  BluetoothPrintPrintReceiptController bluetoothPrintPrintReceiptController =
      BluetoothPrintPrintReceiptController();

  // BluetoothDevice bluetoothDevice;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<BluetoothPrintStartScanCubit>(
      create: (context) => createCubitAndAssignToController(context),
      child: BlocConsumer<BluetoothPrintStartScanCubit,
          BluetoothPrintStartScanState>(
        listener: (context, state) {
          if (onStateChanged != null) {
            onStateChanged!(state);
          }
        },
        builder: (context, state) {
          initializeController(context);
          BluetoothState bluetoothState =
              BlocProvider.of<BluetoothCubit>(context).state;

          return state.bluetoothPrintStartScanResponse != null &&
                  state.bluetoothPrintStartScanResponse.isNotEmpty
              ? Container(
                  padding: edge_insets_x_16,
                  child: BluetoothPrintBluetoothDevices())
              : const Center(
                  child: Text("loading devices"),
                );
        },
      ),
    );
  }

  @override
  BluetoothPrintStartScanCubit createCubitAndAssignToController(
      BuildContext context) {
    BluetoothPrintStartScanCubit cubit =
        BluetoothPrintStartScanCubit(context: context);
    controller?.cubit = cubit;
    controller?.childContext = context;
    return cubit;
  }
}

class BluetoothPrintStartScanEmptyWidget extends BluetoothPrintStartScan {
  BluetoothPrintStartScanEmptyWidget({super.key, super.controller});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
