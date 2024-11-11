part of 'bluetooth_print_start_scan_cubit.dart';

@freezed
class BluetoothPrintStartScanState with _$BluetoothPrintStartScanState {
  const factory BluetoothPrintStartScanState.initial({
    dynamic bluetoothPrintStartScanResponse,
    @Default(BooleanStatus.initial) BooleanStatus bluetoothPrintStartScanStatus,
    BluetoothPrintDisconnectDeviceState? bluetoothPrintDisconnectDeviceState,
    BluetoothPrintPrintReceiptState? bluetoothPrintPrintReceiptState
  }) = _Initial;
}
