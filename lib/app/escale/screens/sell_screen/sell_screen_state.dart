part of 'sell_screen_cubit.dart';

@freezed
class SellScreenState with _$SellScreenState {
  const factory SellScreenState.initial({
    GetAllTransactionsState? getAllTransactionsState,
    SellFormTemplateState? sellFormTemplateState,
    bool? loadingButton,
    List<GetAllTrucksResponse>? getAllTrucksResponse,
    @Default(BooleanStatus.initial) BooleanStatus getAllTrucksStatus,
    List<GetAllCustomersResponse>? getAllCustomersResponse,
    @Default(BooleanStatus.initial) BooleanStatus getAllCustomersStatus,
}) = _Initial;
}
