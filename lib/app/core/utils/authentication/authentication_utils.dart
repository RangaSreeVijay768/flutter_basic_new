import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../../user_accounts/models/users/user_account.dart';


class AuthenticationUtils {
  static Future<UserAccount?> getUserAccountFromSharedPreferences() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? userAccountString = sharedPreferences.getString("user");
    if (userAccountString != null && userAccountString.isNotEmpty) {
      UserAccount userAccount =
      UserAccount.fromJson(jsonDecode(userAccountString));
      return Future.value(userAccount);
    }
    return Future.value(null);
  }
}
