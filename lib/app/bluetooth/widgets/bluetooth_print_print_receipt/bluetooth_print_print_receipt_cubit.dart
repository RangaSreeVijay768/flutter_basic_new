import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:basic/app/bluetooth/repo/models/bluetooth_print_print_receipt/bluetooth_print_print_receipt_request.dart';
import '../../services/bluetooth_service.dart';
import '/app/core/blocs/base_cubit.dart';
import 'package:get_it/get_it.dart';
import '/app/core/database/boolean_status.dart';

part 'bluetooth_print_print_receipt_state.dart';

part 'bluetooth_print_print_receipt_cubit.freezed.dart';

class BluetoothPrintPrintReceiptCubit
    extends BaseCubit<BluetoothPrintPrintReceiptState> {
  late BluetoothService bluetoothService;
  BluetoothPrintPrintReceiptCubit({required super.context})
      : super(initialState: BluetoothPrintPrintReceiptState.initial()){
    bluetoothService = GetIt.instance<BluetoothService>();
  }
  
    BluetoothPrintPrintReceiptRequest createRequestData({dynamic? config, List? data}) {
        final request = BluetoothPrintPrintReceiptRequest(
          config: config ?? state.config??Map<String,dynamic>(),
            data: data ?? state.data
        );
        return request;
      }

    Future<dynamic> printReceipt(
        BluetoothPrintPrintReceiptRequest request) async {
        return bluetoothService.printReceipt(config: request.config, data: request.data).then((value) {
          emit(state.copyWith(
              bluetoothPrintPrintReceiptResponse: value,
              bluetoothPrintPrintReceiptStatus: BooleanStatus.success));
          return Future.value(value);
        }).catchError((error) {
          emit(state.copyWith(bluetoothPrintPrintReceiptStatus: BooleanStatus.error));
          throw error;
        });
      }
}
