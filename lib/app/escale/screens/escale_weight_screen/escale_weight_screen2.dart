import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:usb_serial/transaction.dart';
import 'package:usb_serial/usb_serial.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ElectronicScaleApp extends StatefulWidget {
  @override
  _ElectronicScaleAppState createState() => _ElectronicScaleAppState();
}

class _ElectronicScaleAppState extends State<ElectronicScaleApp> {
  UsbPort? _port;
  String _status = "Idle";
  String _weight = "0.0";

  StreamSubscription<String>? _subscription;
  Transaction<String>? _transaction;
  UsbDevice? _device;

  void _showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.black54,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

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
      setState(() {
        _status = "Disconnected";
      });
      _showToast("Disconnected from device");
      return;
    }

    _port = await device.create();
    if (!await _port!.open()) {
      setState(() {
        _status = "Failed to open port";
      });
      _showToast("Failed to open port");
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
      setState(() {
        _weight = line;
      });
    });

    setState(() {
      _status = "Connected";
    });
    _showToast("Connected to device");
  }

  Future<void> _getPorts() async {
    List<UsbDevice> devices = await UsbSerial.listDevices();
    if (!devices.contains(_device)) {
      await _connectTo(null);
    }

    if (devices.isNotEmpty) {
      await _connectTo(devices.first);
    } else {
      _showToast("No USB devices found");
    }
  }

  @override
  void initState() {
    super.initState();

    UsbSerial.usbEventStream!.listen((UsbEvent event) {
      _getPorts();
    });

    _getPorts();
  }

  @override
  void dispose() {
    super.dispose();
    _connectTo(null);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Electronic Scale App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Status: $_status", style: TextStyle(fontSize: 18)),
            SizedBox(height: 20),
            Text("Weight: ${double.parse(_weight) * 10} kg", style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
            Text("Weight: ${(double.parse(_weight) * 10).toStringAsFixed(0)} kg", style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
