import 'package:json_annotation/json_annotation.dart';

part 'bluetooth_print_start_scan_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class BluetoothPrintStartScanResponse {

  factory BluetoothPrintStartScanResponse.fromJson(Map<String, dynamic> json) =>
      _$BluetoothPrintStartScanResponseFromJson(json);

  Map<String, dynamic> toJson() =>
      _$BluetoothPrintStartScanResponseToJson(this);

  BluetoothPrintStartScanResponse();
}
