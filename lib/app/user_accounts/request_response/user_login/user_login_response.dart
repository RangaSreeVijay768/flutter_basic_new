import 'package:json_annotation/json_annotation.dart';

import '../../models/users/user_account.dart';

part 'user_login_response.g.dart';

@JsonSerializable()
class UserLoginResponse extends UserAccount {

  factory UserLoginResponse.fromJson(Map<String, dynamic> json) =>
      _$UserLoginResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UserLoginResponseToJson(this);

  UserLoginResponse({
    required super.accessToken,
    required super.email,
    required super.id,
    required super.refreshToken,
    required super.roles,
    required super.shops,
    required super.username
});
}
