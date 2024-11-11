import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import '../../../bluetooth/widgets/bluetooth_print_disconnect_device/bluetooth_print_disconnect_device.dart';
import '../../../bluetooth/widgets/bluetooth_print_print_receipt/bluetooth_print_print_receipt.dart';
import '../../../bluetooth/widgets/bluetooth_print_start_scan/bluetooth_print_start_scan.dart';
import '../../../themes/fonts.dart';
import '/app/themes/borders.dart';
import '/app/themes/edge_insets.dart';
import 'package:go_router/go_router.dart';

import 'bluetooth_printer_screen_controller.dart';
import 'bluetooth_printer_screen_cubit.dart';

import '/app/core/widgets/base_stateless_widget.dart';

class BluetoothPrinterScreen
    extends BaseStatelessWidget<BluetoothPrinterScreenController,
        BluetoothPrinterScreenCubit,
        BluetoothPrinterScreenState> {
  BluetoothPrinterScreen({Key? key, super.controller, super.onStateChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<BluetoothPrinterScreenCubit>(
      create: (context) => createCubitAndAssignToController(context),
      child: BlocConsumer<
          BluetoothPrinterScreenCubit,
          BluetoothPrinterScreenState>(
        listener: (context, state) {
          if (onStateChanged != null) {
            onStateChanged!(state);
          }
        },
        builder: (context, state) {
          initializeController(context);
          return Scaffold(
            appBar: AppBar(
              // leading: IconButton(
              //   onPressed: () {
              //     Navigator.pop(context);
              //   },
              //   icon: Icon(Icons.chevron_left),
              // ),
              title: const Text(
                "Printer",
                style: TextStyle(
                    fontWeight: Fonts.f700, fontSize: Fonts.fontSize20),
              ),
            ),
            body: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 24,
                    ),
                    Container(
                      margin: edge_insets_x_16,
                      child: const Text(
                        "Available Devices",
                        style: TextStyle(
                            fontSize: Fonts.fontSize18, fontWeight: Fonts.f600),
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    BluetoothPrintStartScan(),
                    Divider(),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: BluetoothPrintDisconnectDevice(),
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: BluetoothPrintPrintReceipt(),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Container(
                      decoration: BoxDecoration(border: borders.bb_1px_grey1),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }

  @override
  BluetoothPrinterScreenCubit createCubitAndAssignToController(
      BuildContext context) {
    BluetoothPrinterScreenCubit cubit = BluetoothPrinterScreenCubit(
        context: context);
    controller?.cubit = cubit;
    controller?.childContext = context;
    return cubit;
  }
}
