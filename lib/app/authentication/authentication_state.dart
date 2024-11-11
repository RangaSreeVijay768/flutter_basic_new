part of 'authentication_cubit.dart';

@freezed
class AuthenticationState with _$AuthenticationState {
  const factory AuthenticationState.initial(
      {@Default(BooleanStatus.initial) BooleanStatus authenticationStatus,
      UserAccount? userAccount}) = _Initial;
}
