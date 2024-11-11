import 'package:bloc/bloc.dart';
import 'package:bluetooth_print/bluetooth_print_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:basic/app/bluetooth/repo/models/bluetooth_print_connect_device/bluetooth_print_connect_device_request.dart';
import 'package:basic/app/bluetooth/services/bluetooth_service.dart';
import '/app/core/blocs/base_cubit.dart';
import 'package:get_it/get_it.dart';
import '/app/core/database/boolean_status.dart';

part 'bluetooth_print_connect_device_state.dart';

part 'bluetooth_print_connect_device_cubit.freezed.dart';

class BluetoothPrintConnectDeviceCubit
    extends BaseCubit<BluetoothPrintConnectDeviceState> {
  BluetoothPrintConnectDeviceCubit({required super.context})
      : super(initialState: const BluetoothPrintConnectDeviceState.initial()) {
    bluetoothService = GetIt.instance<BluetoothService>();
    // WidgetsBinding.instance
    //     .addPostFrameCallback((_) => connectDevice(createRequestData()));
  }

  late BluetoothService bluetoothService;

  BluetoothPrintConnectDeviceRequest createRequestData(
      {BluetoothDevice? bluetoothDevice}) {
    final request = BluetoothPrintConnectDeviceRequest(
        bluetoothDevice: bluetoothDevice ?? BluetoothDevice());
    return request;
  }

  Future<dynamic> connectDevice(
      BluetoothPrintConnectDeviceRequest request) async {
    return bluetoothService
        .connectDevice(bluetoothDevice: request.bluetoothDevice)
        .then((value) {
      emit(state.copyWith(
          bluetoothPrintConnectDeviceResponse: value,
          bluetoothPrintConnectDeviceStatus: BooleanStatus.success));
      return Future.value(value);
    }).catchError((error) {
      emit(state.copyWith(
          bluetoothPrintConnectDeviceStatus: BooleanStatus.error));
      throw error;
    });
  }
}
