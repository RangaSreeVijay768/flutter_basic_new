part of 'user_accounts_login_form_widget_cubit.dart';

@freezed
class UserAccountsLoginFormWidgetState with _$UserAccountsLoginFormWidgetState {
  const factory UserAccountsLoginFormWidgetState.initial({
    ControlStatus? formValid,
    UserLoginResponse? userLoginResponse,
    @Default(BooleanStatus.initial) BooleanStatus userLoginStatus,
  }) = _Initial;
}
