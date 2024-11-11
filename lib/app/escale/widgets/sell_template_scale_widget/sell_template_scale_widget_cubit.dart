import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:usb_serial/transaction.dart';
import 'package:usb_serial/usb_serial.dart';
import '/app/core/blocs/base_cubit.dart';
import 'package:get_it/get_it.dart';
import '/app/core/database/boolean_status.dart';

part 'sell_template_scale_widget_state.dart';

part 'sell_template_scale_widget_cubit.freezed.dart';



class SellTemplateScaleWidgetCubit
    extends BaseCubit<SellTemplateScaleWidgetState> {
  UsbPort? _port;
  StreamSubscription<String>? _subscription;
  Transaction<String>? _transaction;

  SellTemplateScaleWidgetCubit({required super.context})
      : super(initialState: const SellTemplateScaleWidgetState.initial(
      status: "Idle", weight: "0.0", device: null
  )){
    getAvailablePorts();
  }

  Future<void> _showToast(String message) async {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.black54,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  Future<void> connectToDevice(UsbDevice? device) async {
    await _clearConnections();

    if (device == null) {
      emit(state.copyWith(status: "Disconnected", device: null));
      _showToast("Disconnected from device");
      return;
    }

    _port = await device.create();
    if (!await _port!.open()) {
      emit(state.copyWith(status: "Failed to open port"));
      _showToast("Failed to open port");
      return;
    }

    await _port!.setDTR(true);
    await _port!.setRTS(true);
    await _port!.setPortParameters(
        9600, UsbPort.DATABITS_8, UsbPort.STOPBITS_1, UsbPort.PARITY_NONE);

    _transaction = Transaction.stringTerminated(
      _port!.inputStream as Stream<Uint8List>,
      Uint8List.fromList([13, 10]),
    );
    _subscription = _transaction!.stream.listen((String line) {
      double parsedWeight = double.tryParse(line) ?? 0.0;
      emit(state.copyWith(weight: (parsedWeight * 10).toStringAsFixed(2)));
    });

    emit(state.copyWith(status: "Connected", device: device));
    _showToast("Connected to device");
  }

  Future<void> getAvailablePorts() async {
    List<UsbDevice> devices = await UsbSerial.listDevices();
    if (!devices.contains(state.device)) {
      await connectToDevice(null);
    }
    if (devices.isNotEmpty) {
      await connectToDevice(devices.first);
    } else {
      _showToast("No USB devices found");
    }
  }

  Future<void> _clearConnections() async {
    if (_subscription != null) await _subscription!.cancel();
    if (_transaction != null) _transaction!.dispose();
    if (_port != null) await _port!.close();
    _subscription = null;
    _transaction = null;
    _port = null;
  }

  @override
  Future<void> close() async {
    await _clearConnections();
    super.close();
  }
}
