part of 'bluetooth_print_disconnect_device_cubit.dart';

@freezed
class BluetoothPrintDisconnectDeviceState
    with _$BluetoothPrintDisconnectDeviceState {
  const factory BluetoothPrintDisconnectDeviceState.initial({
    dynamic bluetoothPrintDisconnectDeviceResponse,
    @Default(BooleanStatus.initial) BooleanStatus bluetoothPrintDisconnectDeviceStatus,
  }) = _Initial;
}
