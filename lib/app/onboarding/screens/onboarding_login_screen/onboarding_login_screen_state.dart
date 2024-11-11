part of 'onboarding_login_screen_cubit.dart';

@freezed
class OnboardingLoginScreenState with _$OnboardingLoginScreenState {
  const factory OnboardingLoginScreenState.initial({
    UserAccountsLoginFormWidgetState? userAccountsLoginFormWidgetState,
    bool? loadingButton
}) = _Initial;
}
