import 'package:bluetooth_print/bluetooth_print_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get_it/get_it.dart';

import '../../core/blocs/base_cubit.dart';
import '../../core/database/boolean_status.dart';
import '../../core/logger/log.dart';
import '../services/bluetooth_service.dart';

part 'bluetooth_cubit.freezed.dart';
part 'bluetooth_state.dart';

class BluetoothCubit extends BaseCubit<BluetoothState> {
  late BluetoothService bluetoothService;

  BluetoothCubit({required super.context})
      : super(initialState: BluetoothState.initial()) {
    logger.d("initialize bluetooth");
    bluetoothService = GetIt.instance<BluetoothService>();
    emitState(state.copyWith(bluetoothStatus: BooleanStatus.pending));
    // throw 'Cannot initialize';
    autoConnectIfNeeded();
  }

  autoConnectIfNeeded() async {
    bool isOn = await bluetoothService.isOn();
    logger.d("Bluetooth is ${isOn}");
    if (isOn) {
      List<BluetoothDevice> blueToothDevices =
          await bluetoothService.startScan(timeout: Duration(seconds: 4));
      logger.d("Bluetooth finished ${blueToothDevices.length}");
      if (blueToothDevices.isNotEmpty) {
        BluetoothDevice? bluetoothDevice =
            await bluetoothService.autoConnectDevice(blueToothDevices);
        if (bluetoothDevice != null) {
          emitState(state.copyWith(
              bluetoothDevice: bluetoothDevice,
              bluetoothStatus: BooleanStatus.success));
        }
      }
    }
  }
}
