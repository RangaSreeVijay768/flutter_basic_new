part of 'bluetooth_print_bluetooth_devices_cubit.dart';

@freezed
class BluetoothPrintBluetoothDevicesState
    with _$BluetoothPrintBluetoothDevicesState {
  const factory BluetoothPrintBluetoothDevicesState.initial({
    BluetoothState? bluetoothState,
    @Default(false) bool connected,
    BluetoothPrintConnectDeviceState? bluetoothPrintConnectDeviceState,
  }) = _Initial;
}
