part of 'sell_screen_template_cubit.dart';

@freezed
class SellScreenTemplateState with _$SellScreenTemplateState {
  const factory SellScreenTemplateState.initial({
    Trucks? selectedTruck,
    String? selectedItem,
    Customers? selectedCustomer,
    required String purchaseType,
    int? lotSize,
    double? constPrice,
    double? itemWeight,
    CreateTransactionResponse? createTransactionResponse,
    @Default(BooleanStatus.initial) BooleanStatus createTransactionStatus,
    BluetoothState? bluetoothState,
    BluetoothPrintPrintReceiptState? bluetoothPrintPrintReceiptState,
    @Default(BooleanStatus.initial) BooleanStatus printerConnectionStatus,
    GetTransactionsByCustomerIdState? getTransactionsByCustomerIdState,
    List<GetTransactionsByCustomerIdResponse>? getTransactionsByCustomerIdResponse
  }) = _Initial;
}
