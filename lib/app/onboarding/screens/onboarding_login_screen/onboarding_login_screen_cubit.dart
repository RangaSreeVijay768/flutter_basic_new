import 'package:basic/app/user_accounts/widgets/user_accounts_login_form_widget/user_accounts_login_form_widget_cubit.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:basic/app/core/blocs/base_cubit.dart';

import 'package:get_it/get_it.dart';

part 'onboarding_login_screen_state.dart';

part 'onboarding_login_screen_cubit.freezed.dart';

class OnboardingLoginScreenCubit extends BaseCubit<OnboardingLoginScreenState> {
  OnboardingLoginScreenCubit({required super.context})
      : super(initialState: OnboardingLoginScreenState.initial(loadingButton: false));


  setLoadingButtonStatus(bool? val) {
    emitState(state.copyWith(loadingButton: val));
  }
}
