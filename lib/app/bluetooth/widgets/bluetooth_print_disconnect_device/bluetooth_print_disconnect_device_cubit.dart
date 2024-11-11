import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:basic/app/bluetooth/repo/models/bluetooth_print_disconnect_device/bluetooth_print_disconnect_device_request.dart';
import 'package:basic/app/bluetooth/repo/models/bluetooth_print_disconnect_device/bluetooth_print_disconnect_device_response.dart';
import 'package:basic/app/bluetooth/services/bluetooth_service.dart';
import '/app/core/blocs/base_cubit.dart';
import 'package:get_it/get_it.dart';
import '/app/core/database/boolean_status.dart';

part 'bluetooth_print_disconnect_device_state.dart';

part 'bluetooth_print_disconnect_device_cubit.freezed.dart';

class BluetoothPrintDisconnectDeviceCubit
    extends BaseCubit<BluetoothPrintDisconnectDeviceState> {
  BluetoothPrintDisconnectDeviceCubit({required super.context})
      : super(initialState: BluetoothPrintDisconnectDeviceState.initial()){
    bluetoothService = GetIt.instance<BluetoothService>();
  }
  late BluetoothService bluetoothService;


    BluetoothPrintDisconnectDeviceRequest createRequestData() {
        final request = BluetoothPrintDisconnectDeviceRequest();
        return request;
      }

    Future<dynamic> disconnectDevice(
        BluetoothPrintDisconnectDeviceRequest request) async {
        return bluetoothService.disconnectDevice().then((value) {
          emit(state.copyWith(
              bluetoothPrintDisconnectDeviceResponse: value,
              bluetoothPrintDisconnectDeviceStatus: BooleanStatus.success));
          return Future.value(value);
        }).catchError((error) {
          emit(state.copyWith(bluetoothPrintDisconnectDeviceStatus: BooleanStatus.error));
          throw error;
        });
      }
}
