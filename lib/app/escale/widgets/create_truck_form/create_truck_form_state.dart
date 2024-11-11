part of 'create_truck_form_cubit.dart';

@freezed
class CreateTruckFormState with _$CreateTruckFormState {
  const factory CreateTruckFormState.initial({
    Items? items,
    ControlStatus? formValid,
    CreateTruckResponse? createTruckResponse,
    @Default(BooleanStatus.initial) BooleanStatus createTruckStatus,
  }) = _Initial;
}
