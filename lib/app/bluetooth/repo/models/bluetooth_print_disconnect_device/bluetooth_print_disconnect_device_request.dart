import 'package:json_annotation/json_annotation.dart';

part 'bluetooth_print_disconnect_device_request.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class BluetoothPrintDisconnectDeviceRequest {

  factory BluetoothPrintDisconnectDeviceRequest.fromJson(
      Map<String, dynamic> json) =>
      _$BluetoothPrintDisconnectDeviceRequestFromJson(json);

  Map<String, dynamic> toJson() =>
      _$BluetoothPrintDisconnectDeviceRequestToJson(this);

  BluetoothPrintDisconnectDeviceRequest();
}
