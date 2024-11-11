part of 'customer_screen_cubit.dart';

@freezed
class CustomerScreenState with _$CustomerScreenState {
  const factory CustomerScreenState.initial({
    GetAllCustomersState? getAllCustomersState
}) = _Initial;
}
