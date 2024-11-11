part of 'get_transactions_by_truck_customer_cubit.dart';

@freezed
class GetTransactionsByTruckCustomerState
    with _$GetTransactionsByTruckCustomerState {
  const factory GetTransactionsByTruckCustomerState.initial({
    required int customerId,
    required int truckId,
    List<GetTransactionsByTruckAndCustomerResponse>? getTransactionsByTruckAndCustomerResponse,
    @Default(BooleanStatus.initial) BooleanStatus getTransactionsByTruckAndCustomerStatus,
}) = _Initial;
}
