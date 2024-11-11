import 'package:bluetooth_print/bluetooth_print_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get_it/get_it.dart';
import 'package:basic/app/bluetooth/services/bluetooth_service.dart';
import 'package:basic/app/bluetooth/state/bluetooth_cubit.dart';
import 'package:basic/app/core/logger/log.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '/app/core/blocs/base_cubit.dart';
import '/app/core/database/boolean_status.dart';

part 'bluetooth_auto_connect_device_cubit.freezed.dart';
part 'bluetooth_auto_connect_device_state.dart';

class BluetoothAutoConnectDeviceCubit
    extends BaseCubit<BluetoothAutoConnectDeviceState> {
  late BluetoothService bluetoothService;

  BluetoothAutoConnectDeviceCubit({required super.context})
      : super(initialState: BluetoothAutoConnectDeviceState.initial()) {
    bluetoothService = GetIt.instance<BluetoothService>();
    initializeLastConnectedStatus();
  }

  initializeLastConnectedStatus() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? lastConnectedAddressId =
        sharedPreferences.getString("last_connected_bluetooth");
    logger.d(lastConnectedAddressId);
    emitState(state.copyWith(
        lastConnectedAddress: lastConnectedAddressId,
        status: BooleanStatus.pending));
  }

  updateCurrentDevicesAndConnect(List<BluetoothDevice> bluetoothDevices) async {
    if (state.status == BooleanStatus.pending &&
        state.lastConnectedAddress != null) {
      Iterable<BluetoothDevice> matchingDevices = bluetoothDevices
          .where((element) => element.address == (state.lastConnectedAddress));
      if (matchingDevices.isNotEmpty) {
        logger.d("${state.lastConnectedAddress} and current is ${matchingDevices.first.address}");
        bool connected = await bluetoothService.connectDevice(
            bluetoothDevice: matchingDevices.first);
        if (connected) {
          BluetoothCubit bluetoothCubit =
              BlocProvider.of<BluetoothCubit>(context);
          BluetoothState bluetoothState = bluetoothCubit.state;
          bluetoothCubit.emitState(bluetoothState.copyWith(
              bluetoothDevice: matchingDevices.first,
              bluetoothStatus: BooleanStatus.success));
        } else {
          logger.d('not connected');
        }
      }
    }
  }
}
