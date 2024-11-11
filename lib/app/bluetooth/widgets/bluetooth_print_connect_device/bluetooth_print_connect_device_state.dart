part of 'bluetooth_print_connect_device_cubit.dart';

@freezed
class BluetoothPrintConnectDeviceState with _$BluetoothPrintConnectDeviceState {
  const factory BluetoothPrintConnectDeviceState.initial({
    dynamic bluetoothPrintConnectDeviceResponse,
    @Default(BooleanStatus.initial) BooleanStatus bluetoothPrintConnectDeviceStatus,
  }) = _Initial;
}
