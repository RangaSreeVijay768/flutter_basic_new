import 'package:json_annotation/json_annotation.dart';

part 'bluetooth_print_print_receipt_request.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class BluetoothPrintPrintReceiptRequest {
  dynamic config;
  List? data;

  factory BluetoothPrintPrintReceiptRequest.fromJson(
      Map<String, dynamic> json) =>
      _$BluetoothPrintPrintReceiptRequestFromJson(json);

  Map<String, dynamic> toJson() =>
      _$BluetoothPrintPrintReceiptRequestToJson(this);

  BluetoothPrintPrintReceiptRequest({required this.config, required this.data});
}
