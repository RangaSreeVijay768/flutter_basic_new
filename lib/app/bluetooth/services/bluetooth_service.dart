import 'package:bluetooth_print/bluetooth_print.dart';
import 'package:bluetooth_print/bluetooth_print_model.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/logger/log.dart';

@singleton
class BluetoothService {
  late BluetoothPrint bluetoothPrint;


  BluetoothService(){
    bluetoothPrint=BluetoothPrint.instance;
  }

  void initializeService() {
    if (bluetoothPrint == null) {
      bluetoothPrint = BluetoothPrint.instance;
    }
  }

  Future<void> saveLastConnectionId(String address) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString("last_connected_bluetooth", address);
  }

  Future<String?> getLastConnectionId() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return Future.value(sharedPreferences.getString("last_connected_bluetooth"));
  }

  Future<BluetoothDevice?> autoConnectDevice(
      List<BluetoothDevice> bluetoothDevices) async {
    String? lastConnectionId = await getLastConnectionId();
    logger.d("Last connection id: ${lastConnectionId}");
    if (lastConnectionId != null) {
      Iterable<BluetoothDevice> matchingBluetoothDevices = bluetoothDevices
          .where((element) => element.address == lastConnectionId);
      if (matchingBluetoothDevices.isNotEmpty) {
        BluetoothDevice bluetoothDevice = matchingBluetoothDevices.first;
        connectDevice(bluetoothDevice: bluetoothDevice);
        return Future.value(bluetoothDevice);
      }
    }
    return Future.value(null);
  }

  Future<bool> isOn() {
    initializeService();
    return bluetoothPrint.isOn;
  }

  Future<dynamic> startScan({Duration? timeout}) async {
    initializeService();
    return bluetoothPrint.startScan(
      timeout: timeout,
    );
  }

  Future<dynamic> connectDevice({required BluetoothDevice bluetoothDevice}) async{
    bool connected=await bluetoothPrint.connect(bluetoothDevice);
    if (connected) {
      await saveLastConnectionId(bluetoothDevice.address!);

    }
    return Future.value(connected);
  }

  Future<dynamic> disconnectDevice() {
    return bluetoothPrint.disconnect();
  }

  Future<dynamic> printReceipt({required config, required data}) {
    return bluetoothPrint.printReceipt(config, data);
  }
}
