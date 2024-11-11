import 'package:basic/app/core/logger/log.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../core/blocs/base_cubit.dart';
import '../core/database/boolean_status.dart';
import '../core/utils/authentication/authentication_utils.dart';
import '../user_accounts/models/users/user_account.dart';

part 'authentication_cubit.freezed.dart';
part 'authentication_state.dart';

class AuthenticationCubit extends BaseCubit<AuthenticationState> {
  AuthenticationCubit({required super.context})
      : super(initialState: AuthenticationState.initial()) {
    getUserAccountFromSharedPreferences();
  }

  Future<UserAccount?> getUserAccountFromSharedPreferences() async {
    UserAccount? userAccount =
        await AuthenticationUtils.getUserAccountFromSharedPreferences();
    if (userAccount != null) {
      emit(state.copyWith(
          userAccount: userAccount,
          authenticationStatus: BooleanStatus.success));
    } else {
      emit(state.copyWith(authenticationStatus: BooleanStatus.error));
    }
    return Future.value(userAccount);
  }

  Future<bool> saveUserAccount(UserAccount userAccount) async {
    emit(state.copyWith(
        userAccount: userAccount,
        authenticationStatus: BooleanStatus.success));
    logger.d("UserAccount saved");
    return Future.value(true);
  }
}
