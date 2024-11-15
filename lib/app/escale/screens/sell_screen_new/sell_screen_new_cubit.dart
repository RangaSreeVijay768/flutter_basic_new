import 'package:basic/app/core/logger/log.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../bluetooth/services/bluetooth_service.dart';
import '../../../bluetooth/widgets/bluetooth_print_connect_device/bluetooth_print_connect_device_cubit.dart';
import '../../request_response/get_all_customers/get_all_customers_response.dart';
import '../../request_response/get_all_trucks/get_all_trucks_response.dart';
import '../../widgets/get_all_transactions/get_all_transactions_cubit.dart';
import '../../widgets/sell_form_template/sell_form_template_cubit.dart';
import '../../widgets/sell_screen_template/sell_screen_template_cubit.dart';
import '/app/core/blocs/base_cubit.dart';
import 'package:get_it/get_it.dart';
import '/app/core/database/boolean_status.dart';

part 'sell_screen_new_state.dart';

part 'sell_screen_new_cubit.freezed.dart';

class SellScreenNewCubit extends BaseCubit<SellScreenNewState> {
  late BluetoothService bluetoothService;
  SellScreenNewCubit({required super.context})
      : super(initialState: SellScreenNewState.initial()){
    bluetoothService=GetIt.instance<BluetoothService>();
    printerConnectionStatus();
  }


  Future<void> printerConnectionStatus() async{
    logger.d("checking");
    bool isConnected = await bluetoothService.getConnectionStatus();
    logger.d(isConnected);

    if (isConnected) {
      emit(state.copyWith(printerConnectionStatus: BooleanStatus.success));
    } else {
      emit(state.copyWith(printerConnectionStatus: BooleanStatus.pending));
    }  }

  void disconnect() async{
    await bluetoothService.disconnectDevice();
    emit(state.copyWith(printerConnectionStatus: BooleanStatus.pending));
  }

  void updatePrinterConnectionStatus() {
    printerConnectionStatus();
  }

}
