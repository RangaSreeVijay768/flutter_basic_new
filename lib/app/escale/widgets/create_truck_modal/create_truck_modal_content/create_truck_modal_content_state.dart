part of 'create_truck_modal_content_cubit.dart';

@freezed
class CreateTruckModalContentState with _$CreateTruckModalContentState {
  const factory CreateTruckModalContentState.initial({
    bool? loadingButton,
    CreateTruckFormState? createTruckFormState
}) = _Initial;
}
