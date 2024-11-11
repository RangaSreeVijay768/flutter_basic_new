import 'package:json_annotation/json_annotation.dart';

part 'bluetooth_print_start_scan_request.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class BluetoothPrintStartScanRequest {

  Duration? timeout;

  factory BluetoothPrintStartScanRequest.fromJson(Map<String, dynamic> json) =>
      _$BluetoothPrintStartScanRequestFromJson(json);

  Map<String, dynamic> toJson() => _$BluetoothPrintStartScanRequestToJson(this);

  BluetoothPrintStartScanRequest({this.timeout});
}
