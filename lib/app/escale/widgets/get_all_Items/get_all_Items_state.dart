part of 'get_all_Items_cubit.dart';

@freezed
class GetAllItemsState with _$GetAllItemsState {
  const factory GetAllItemsState.initial({
    List<GetAllItemsResponse>? getAllItemsResponse,
    @Default(BooleanStatus.initial) BooleanStatus getAllItemsStatus,
}) = _Initial;
}
