import 'package:basic/app/core/logger/log.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:basic/app/core/blocs/base_cubit.dart';
import 'package:get_it/get_it.dart';

import 'package:basic/app/core/database/boolean_status.dart';

import '../../request_response/user_login/user_login_request.dart';
import '../../request_response/user_login/user_login_response.dart';
import '../../services/user_account_service.dart';

part 'user_accounts_login_form_widget_state.dart';

part 'user_accounts_login_form_widget_cubit.freezed.dart';

class UserAccountsLoginFormWidgetCubit
    extends BaseFormCubit<UserAccountsLoginFormWidgetState> {
  late UserAccountService userAccountService;
  UserAccountsLoginFormWidgetCubit({required super.context})
      : super(initialState: UserAccountsLoginFormWidgetState.initial()){
    userAccountService=GetIt.instance<UserAccountService>();
  }

    UserLoginRequest createRequestData({
      String? username,
      String? password
      }) {
        final request = UserLoginRequest(
          username: username ?? formGroup.control('username').value,
          password: password ?? formGroup.control('password').value
        );
        return request;
      }

    Future<UserLoginResponse> login(
        UserLoginRequest request) async {
        return userAccountService.login(request).then((value) {
          emit(state.copyWith(
              userLoginResponse: value,
              userLoginStatus: BooleanStatus.success));
          showSuccessMessage("Signin success");
          userAccountService.saveUserAuthTokenToSharedPreference(value);
          return Future.value(value);
        }).catchError((error) {
          emit(state.copyWith(userLoginStatus: BooleanStatus.error));
          throw error;
        });
      }

  @override
  FormGroup getFormGroup() {
    return FormGroup({
      'username': FormControl<String>(validators: [Validators.required]),
      'password': FormControl<String>(validators: [Validators.required]),
    });
  }

  @override
  void updateFormValidationState(ControlStatus event) {
    emit(state.copyWith(formValid: event));
  }
}
