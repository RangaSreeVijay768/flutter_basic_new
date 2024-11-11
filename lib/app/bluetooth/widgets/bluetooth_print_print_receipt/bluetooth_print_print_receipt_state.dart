part of 'bluetooth_print_print_receipt_cubit.dart';

@freezed
class BluetoothPrintPrintReceiptState with _$BluetoothPrintPrintReceiptState {
  const factory BluetoothPrintPrintReceiptState.initial({
    dynamic bluetoothPrintPrintReceiptResponse,
    @Default(BooleanStatus.initial) BooleanStatus bluetoothPrintPrintReceiptStatus,
    dynamic config,
    List? data
  }) = _Initial;
}

