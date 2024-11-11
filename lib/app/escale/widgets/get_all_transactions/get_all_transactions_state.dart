part of 'get_all_transactions_cubit.dart';

@freezed
class GetAllTransactionsState with _$GetAllTransactionsState {
  const factory GetAllTransactionsState.initial({
    List<GetAllTransactionsResponse>? getAllTransactionsResponse,
    @Default(BooleanStatus.initial) BooleanStatus getAllTransactionsStatus,
}) = _Initial;
}
