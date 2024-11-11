part of 'bluetooth_auto_connect_device_cubit.dart';

@freezed
class BluetoothAutoConnectDeviceState with _$BluetoothAutoConnectDeviceState {
  const factory BluetoothAutoConnectDeviceState.initial(
      {List<BluetoothDevice>? bluetoothDevices,
      BluetoothDevice? connectedDevice,
      String? lastConnectedAddress,
        @Default(BooleanStatus.initial)BooleanStatus status
      }) = _Initial;
}
