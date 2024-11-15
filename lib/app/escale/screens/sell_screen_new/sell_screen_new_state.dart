part of 'sell_screen_new_cubit.dart';

@freezed
class SellScreenNewState with _$SellScreenNewState {
  const factory SellScreenNewState.initial({
    GetAllTransactionsState? getAllTransactionsState,
    SellScreenTemplateState? sellScreenTemplateState,
    bool? loadingButton,
    List<GetAllTrucksResponse>? getAllTrucksResponse,
    @Default(BooleanStatus.initial) BooleanStatus getAllTrucksStatus,
    List<GetAllCustomersResponse>? getAllCustomersResponse,
    @Default(BooleanStatus.initial) BooleanStatus getAllCustomersStatus,
    BluetoothPrintConnectDeviceState? bluetoothState,
    @Default(BooleanStatus.initial) BooleanStatus printerConnectionStatus,
  }) = _Initial;
}
