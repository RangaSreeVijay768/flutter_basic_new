import 'package:json_annotation/json_annotation.dart';

part 'bluetooth_print_connect_device_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class BluetoothPrintConnectDeviceResponse {

  factory BluetoothPrintConnectDeviceResponse.fromJson(
      Map<String, dynamic> json) =>
      _$BluetoothPrintConnectDeviceResponseFromJson(json);

  Map<String, dynamic> toJson() =>
      _$BluetoothPrintConnectDeviceResponseToJson(this);

  BluetoothPrintConnectDeviceResponse();
}
