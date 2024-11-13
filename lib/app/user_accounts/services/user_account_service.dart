import 'dart:convert';

import 'package:basic/app/core/logger/log.dart';
import 'package:basic/app/user_accounts/repos/user_accounts_repo.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/users/user_account.dart';
import '../request_response/user_login/user_login_request.dart';
import '../request_response/user_login/user_login_response.dart';

@singleton
class UserAccountService {
  late UserAccountRepo userAccountsRepo;

  UserAccountService() {
    this.userAccountsRepo = GetIt.instance<UserAccountRepo>();
  }

  Future<UserLoginResponse> login(UserLoginRequest userLoginRequest) {
    return userAccountsRepo.login(userLoginRequest);
  }


  Future<bool> saveUserAuthTokenToSharedPreference(
      UserAccount userAccount) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    // logger.d(userAccount.toJson());
    return sharedPreferences.setString(
        "user", jsonEncode(userAccount.toJson()));
  }

  Future<bool> deleteUserAuthTokenFromSharedPreferences() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.remove("user");
  }

}
