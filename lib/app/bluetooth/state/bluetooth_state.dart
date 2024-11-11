part of 'bluetooth_cubit.dart';

@freezed
class BluetoothState with _$BluetoothState {
  const factory BluetoothState.initial({
    BluetoothDevice? bluetoothDevice,
    @Default(BooleanStatus.initial) BooleanStatus bluetoothStatus,
  }) = _Initial;
}
