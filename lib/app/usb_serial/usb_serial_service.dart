import 'dart:async';
import 'dart:typed_data';
import 'package:basic/app/core/widgets/core_toast_success/core_toast_success.dart';
import 'package:basic/app/themes/toast.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:usb_serial/transaction.dart';
import 'package:usb_serial/usb_serial.dart';

import '../core/logger/log.dart';

@singleton
class UsbSerialService {
  UsbPort? _port;
  String _status = "Idle";
  String _weight = "0.0";
  StreamSubscription<String>? _subscription;
  Transaction<String>? _transaction;
  UsbDevice? _device;

  final StreamController<double> _weightController = StreamController<double>.broadcast();

  String get status => _status;
  String get weight => _weight;

  Stream<double> get weightStream => _weightController.stream;

  Future<void> _connectTo(UsbDevice? device) async {
    if (_subscription != null) {
      await _subscription!.cancel();
      _subscription = null;
    }
    if (_transaction != null) {
      _transaction!.dispose();
      _transaction = null;
    }
    if (_port != null) {
      await _port!.close();
      _port = null;
    }

    if (device == null) {
      _device = null;
      _status = "Disconnected";
      return;
    }

    _port = await device.create();
    if (!await _port!.open()) {
      _status = "Failed to open port";
      return;
    }

    _device = device;
    await _port!.setDTR(true);
    await _port!.setRTS(true);
    await _port!.setPortParameters(
        9600, UsbPort.DATABITS_8, UsbPort.STOPBITS_1, UsbPort.PARITY_NONE);

    _transaction = Transaction.stringTerminated(
      _port!.inputStream as Stream<Uint8List>,
      Uint8List.fromList([13, 10]),
    );

    _subscription = _transaction!.stream.listen((String line) {
      _weight = line;
      _weightController.add(double.parse(_weight) * 10);
    });

    _status = "Connected";
  }

  // Connect to the first available USB device
  Future<void> connect() async {
    logger.d("scanning");
    await disconnect();
    logger.d("disconnecting");
    List<UsbDevice> devices = await UsbSerial.listDevices();
    logger.d("connecting");
    if (devices.isNotEmpty) {
      await _connectTo(devices.first);
      ShowToast.toast("connected to scale", Colors.greenAccent);
    } else {
      logger.d("no devices");
      _status = "No USB devices found";
      ShowToast.toast(_status, Colors.redAccent);
    }
  }

  Future<void> disconnect() async {
    await _connectTo(null);
    await _weightController.close();
  }

}
