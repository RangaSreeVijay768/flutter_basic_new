part of 'receive_screen_cubit.dart';

@freezed
class ReceiveScreenState with _$ReceiveScreenState {
  const factory ReceiveScreenState.initial({
    GetAllTrucksState? getAllTrucksState,
    List<GetAllItemsResponse>? getAllItemsResponse,
    @Default(BooleanStatus.initial) BooleanStatus getAllItemsStatus,
  }) = _Initial;
}
