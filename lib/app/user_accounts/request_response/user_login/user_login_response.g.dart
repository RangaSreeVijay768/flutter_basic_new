// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_login_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserLoginResponse _$UserLoginResponseFromJson(Map<String, dynamic> json) =>
    UserLoginResponse(
      accessToken: json['accessToken'] as String?,
      email: json['email'] as String?,
      id: (json['id'] as num?)?.toInt(),
      refreshToken: json['refreshToken'] as String?,
      roles:
          (json['roles'] as List<dynamic>?)?.map((e) => e as String).toList(),
      shops: (json['shops'] as List<dynamic>?)
          ?.map((e) => Shops.fromJson(e as Map<String, dynamic>))
          .toList(),
      username: json['username'] as String?,
    );

Map<String, dynamic> _$UserLoginResponseToJson(UserLoginResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'email': instance.email,
      'roles': instance.roles,
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
      'shops': instance.shops,
    };
