// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_items_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllItemsResponse _$GetAllItemsResponseFromJson(Map<String, dynamic> json) =>
    GetAllItemsResponse()
      ..id = (json['id'] as num?)?.toInt()
      ..name = json['name'] as String?
      ..price = json['price'] as String?
      ..createdAt = json['created_at'] as String?
      ..updatedAt = json['updated_at'] as String?
      ..shopId = (json['shop_id'] as num?)?.toInt();

Map<String, dynamic> _$GetAllItemsResponseToJson(
        GetAllItemsResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'shop_id': instance.shopId,
    };
