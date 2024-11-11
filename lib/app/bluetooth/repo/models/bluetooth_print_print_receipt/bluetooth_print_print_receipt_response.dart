import 'package:json_annotation/json_annotation.dart';

part 'bluetooth_print_print_receipt_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class BluetoothPrintPrintReceiptResponse {

  factory BluetoothPrintPrintReceiptResponse.fromJson(
      Map<String, dynamic> json) =>
      _$BluetoothPrintPrintReceiptResponseFromJson(json);

  Map<String, dynamic> toJson() =>
      _$BluetoothPrintPrintReceiptResponseToJson(this);

  BluetoothPrintPrintReceiptResponse();
}
