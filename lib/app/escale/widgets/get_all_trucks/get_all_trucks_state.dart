part of 'get_all_trucks_cubit.dart';

@freezed
class GetAllTrucksState with _$GetAllTrucksState {
  const factory GetAllTrucksState.initial({
    List<GetAllTrucksResponse>? getAllTrucksResponse,
    @Default(BooleanStatus.initial) BooleanStatus getAllTrucksStatus,
}) = _Initial;
}
