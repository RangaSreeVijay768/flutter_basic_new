// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_customers_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllCustomersResponse _$GetAllCustomersResponseFromJson(
        Map<String, dynamic> json) =>
    GetAllCustomersResponse()
      ..id = (json['id'] as num?)?.toInt()
      ..name = json['name'] as String?
      ..phone = json['phone'] as String?
      ..altphone = json['altphone'] as String?
      ..email = json['email'] as String?
      ..address = json['address'] as String?
      ..createdAt = json['created_at'] as String?
      ..updatedAt = json['updated_at'] as String?
      ..shopId = (json['shop_id'] as num?)?.toInt();

Map<String, dynamic> _$GetAllCustomersResponseToJson(
        GetAllCustomersResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'phone': instance.phone,
      'altphone': instance.altphone,
      'email': instance.email,
      'address': instance.address,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'shop_id': instance.shopId,
    };
