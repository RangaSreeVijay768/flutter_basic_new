part of 'onboarding_login_form_widget_cubit.dart';

@freezed
class OnboardingLoginFormWidgetState with _$OnboardingLoginFormWidgetState {
  const factory OnboardingLoginFormWidgetState.initial({
    ControlStatus? formValid,
    // LoginResponse? loginResponse,
    // @Default(BooleanStatus.initial) BooleanStatus loginStatus,
  }) = _Initial;
}
