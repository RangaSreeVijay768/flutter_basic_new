import 'package:bloc/bloc.dart';
import 'package:bluetooth_print/bluetooth_print.dart';
import 'package:bluetooth_print/bluetooth_print_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:basic/app/bluetooth/state/bluetooth_cubit.dart';
import '../../services/bluetooth_service.dart';
import '../bluetooth_print_connect_device/bluetooth_print_connect_device_cubit.dart';
import '/app/core/blocs/base_cubit.dart';
import 'package:get_it/get_it.dart';
import '/app/core/database/boolean_status.dart';

part 'bluetooth_print_bluetooth_devices_state.dart';

part 'bluetooth_print_bluetooth_devices_cubit.freezed.dart';

class BluetoothPrintBluetoothDevicesCubit
    extends BaseCubit<BluetoothPrintBluetoothDevicesState> {
  late BluetoothService bluetoothService;

  BluetoothPrintBluetoothDevicesCubit({required super.context})
      : super(initialState: BluetoothPrintBluetoothDevicesState.initial()){
    bluetoothService = GetIt.instance<BluetoothService>();
  }

  final BluetoothPrint bluetoothPrint = BluetoothPrint.instance;



  void setConnected(bool connected) {
    emit(state.copyWith(connected: connected));
  }

  // void setDevice(BluetoothDevice device) {
  //   emit(state.copyWith(device: device));
  // }
}
