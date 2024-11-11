import 'package:bluetooth_print/bluetooth_print_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'bluetooth_print_connect_device_request.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class BluetoothPrintConnectDeviceRequest {
  BluetoothDevice bluetoothDevice;

  factory BluetoothPrintConnectDeviceRequest.fromJson(
      Map<String, dynamic> json) =>
      _$BluetoothPrintConnectDeviceRequestFromJson(json);

  Map<String, dynamic> toJson() =>
      _$BluetoothPrintConnectDeviceRequestToJson(this);

  BluetoothPrintConnectDeviceRequest({required this.bluetoothDevice});
}
