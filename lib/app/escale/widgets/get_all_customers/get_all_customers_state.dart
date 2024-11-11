part of 'get_all_customers_cubit.dart';

@freezed
class GetAllCustomersState with _$GetAllCustomersState {
  const factory GetAllCustomersState.initial({
    List<GetAllCustomersResponse>? getAllCustomersResponse,
    @Default(BooleanStatus.initial) BooleanStatus getAllCustomersStatus,
}) = _Initial;
}
