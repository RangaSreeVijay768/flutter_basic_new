import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/app/core/widgets/base_stateless_widget.dart';
import 'bluetooth_print_print_receipt_controller.dart';
import 'bluetooth_print_print_receipt_cubit.dart';

class BluetoothPrintPrintReceipt extends BaseStatelessWidget<
    BluetoothPrintPrintReceiptController,
    BluetoothPrintPrintReceiptCubit,
    BluetoothPrintPrintReceiptState> {
  BluetoothPrintPrintReceipt({
    Key? key,
    super.controller,
    super.onStateChanged,
  }) : super(key: key);

  BluetoothPrintPrintReceiptController bluetoothPrintPrintReceiptController =
      BluetoothPrintPrintReceiptController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<BluetoothPrintPrintReceiptCubit>(
      create: (context) => createCubitAndAssignToController(context),
      child: BlocConsumer<BluetoothPrintPrintReceiptCubit,
          BluetoothPrintPrintReceiptState>(
        listener: (context, state) {
          if (onStateChanged != null) {
            onStateChanged!(state);
          }
        },
        builder: (context, state) {
          initializeController(context);
          return SizedBox.shrink();
        },
      ),
    );
  }

  @override
  BluetoothPrintPrintReceiptCubit createCubitAndAssignToController(
      BuildContext context) {
    BluetoothPrintPrintReceiptCubit cubit =
        BluetoothPrintPrintReceiptCubit(context: context);
    controller?.cubit = cubit;
    controller?.childContext = context;
    return cubit;
  }
}
