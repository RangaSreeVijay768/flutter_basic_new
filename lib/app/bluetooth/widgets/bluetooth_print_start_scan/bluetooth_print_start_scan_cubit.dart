import 'package:bloc/bloc.dart';
import 'package:bluetooth_print/bluetooth_print.dart';
import 'package:bluetooth_print/bluetooth_print_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:basic/app/bluetooth/repo/models/bluetooth_print_start_scan/bluetooth_print_start_scan_request.dart';
import 'package:basic/app/bluetooth/repo/models/bluetooth_print_start_scan/bluetooth_print_start_scan_response.dart';
import 'package:basic/app/bluetooth/services/bluetooth_service.dart';
import 'package:basic/app/bluetooth/widgets/bluetooth_print_connect_device/bluetooth_print_connect_device_cubit.dart';
import 'package:basic/app/bluetooth/widgets/bluetooth_print_disconnect_device/bluetooth_print_disconnect_device_cubit.dart';
import 'package:basic/app/bluetooth/widgets/bluetooth_print_print_receipt/bluetooth_print_print_receipt_cubit.dart';
import 'package:basic/app/core/logger/log.dart';
import '/app/core/blocs/base_cubit.dart';
import 'package:get_it/get_it.dart';
import '/app/core/database/boolean_status.dart';

part 'bluetooth_print_start_scan_state.dart';

part 'bluetooth_print_start_scan_cubit.freezed.dart';

class BluetoothPrintStartScanCubit
    extends BaseCubit<BluetoothPrintStartScanState> {
  BluetoothPrintStartScanCubit({required super.context})
      : super(initialState: BluetoothPrintStartScanState.initial()) {
    bluetoothService = GetIt.instance<BluetoothService>();
    WidgetsBinding.instance
        .addPostFrameCallback((_) => startScan(createRequestData()));
  }

  late BluetoothService bluetoothService;

  BluetoothPrintStartScanRequest createRequestData({Duration? timeout}) {
    final request = BluetoothPrintStartScanRequest(
        timeout: timeout ?? const Duration(seconds: 2));
    return request;
  }

  Future<dynamic> startScan(BluetoothPrintStartScanRequest request) async {
    return bluetoothService.startScan(timeout: request.timeout).then((value) {
      logger.e(value);
      emit(state.copyWith(
          bluetoothPrintStartScanResponse: value,
          bluetoothPrintStartScanStatus: BooleanStatus.success));
      return Future.value(value);
    }).catchError((error) {
      emit(state.copyWith(bluetoothPrintStartScanStatus: BooleanStatus.error));
      throw error;
    });
  }

}
