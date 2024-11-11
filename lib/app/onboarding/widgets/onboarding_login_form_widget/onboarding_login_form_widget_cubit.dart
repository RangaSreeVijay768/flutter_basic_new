import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:get_it/get_it.dart';

import '../../../core/blocs/base_cubit.dart';
import '../../../core/database/boolean_status.dart';

part 'onboarding_login_form_widget_state.dart';

part 'onboarding_login_form_widget_cubit.freezed.dart';

class OnboardingLoginFormWidgetCubit
    extends BaseFormCubit<OnboardingLoginFormWidgetState> {
  OnboardingLoginFormWidgetCubit({required super.context})
      : super(initialState: OnboardingLoginFormWidgetState.initial());

  @override
  FormGroup getFormGroup() {
    return FormGroup({
      'email': FormControl<String>(validators: [Validators.required]),
      'password': FormControl<String>(validators: [Validators.required]),
    });
  }

  @override
  void updateFormValidationState(ControlStatus event) {
    emit(state.copyWith(formValid: event));
  }
}
