part of 'sell_form_template_cubit.dart';

@freezed
class SellFormTemplateState with _$SellFormTemplateState {
  const factory SellFormTemplateState.initial({
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
    GetTransactionsByCustomerIdState? getTransactionsByCustomerIdState,
    List<GetTransactionsByCustomerIdResponse>? getTransactionsByCustomerIdResponse
}) = _Initial;
}
