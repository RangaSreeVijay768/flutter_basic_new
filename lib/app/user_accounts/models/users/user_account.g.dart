// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserAccount _$UserAccountFromJson(Map<String, dynamic> json) => UserAccount(
      id: (json['id'] as num?)?.toInt(),
      username: json['username'] as String?,
      email: json['email'] as String?,
      roles:
          (json['roles'] as List<dynamic>?)?.map((e) => e as String).toList(),
      accessToken: json['accessToken'] as String?,
      refreshToken: json['refreshToken'] as String?,
      shops: (json['shops'] as List<dynamic>?)
          ?.map((e) => Shops.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$UserAccountToJson(UserAccount instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'email': instance.email,
      'roles': instance.roles,
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
      'shops': instance.shops,
    };

Shops _$ShopsFromJson(Map<String, dynamic> json) => Shops(
      number: json['number'] as String?,
      name: json['name'] as String?,
      address: json['address'] as String?,
      id: (json['id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ShopsToJson(Shops instance) => <String, dynamic>{
      'number': instance.number,
      'name': instance.name,
      'address': instance.address,
      'id': instance.id,
    };
