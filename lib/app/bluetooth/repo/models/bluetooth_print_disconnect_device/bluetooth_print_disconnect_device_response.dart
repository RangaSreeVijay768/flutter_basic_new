import 'package:json_annotation/json_annotation.dart';

part 'bluetooth_print_disconnect_device_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class BluetoothPrintDisconnectDeviceResponse {

  factory BluetoothPrintDisconnectDeviceResponse.fromJson(
      Map<String, dynamic> json) =>
      _$BluetoothPrintDisconnectDeviceResponseFromJson(json);

  Map<String, dynamic> toJson() =>
      _$BluetoothPrintDisconnectDeviceResponseToJson(this);

  BluetoothPrintDisconnectDeviceResponse();
}
