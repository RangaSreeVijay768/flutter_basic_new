import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '/app/core/blocs/base_cubit.dart';
import 'package:get_it/get_it.dart';
import '/app/core/database/boolean_status.dart';

part 'bluetooth_printer_screen_state.dart';

part 'bluetooth_printer_screen_cubit.freezed.dart';

class BluetoothPrinterScreenCubit
    extends BaseCubit<BluetoothPrinterScreenState> {
  BluetoothPrinterScreenCubit({required super.context})
      : super(initialState: BluetoothPrinterScreenState.initial());
}
