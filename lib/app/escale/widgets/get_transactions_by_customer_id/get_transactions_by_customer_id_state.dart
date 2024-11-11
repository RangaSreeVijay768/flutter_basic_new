part of 'get_transactions_by_customer_id_cubit.dart';

@freezed
class GetTransactionsByCustomerIdState with _$GetTransactionsByCustomerIdState {
  const factory GetTransactionsByCustomerIdState.initial({
    int? customerId,
    List<GetTransactionsByCustomerIdResponse>? getTransactionsByCustomerIdResponse,
    @Default(BooleanStatus.initial) BooleanStatus getTransactionsByCustomerIdStatus,
}) = _Initial;
}
