// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_trucks_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllTrucksResponse _$GetAllTrucksResponseFromJson(
        Map<String, dynamic> json) =>
    GetAllTrucksResponse()
      ..id = (json['id'] as num?)?.toInt()
      ..number = json['number'] as String?
      ..name = json['name'] as String?
      ..items = json['items'] as String?
      ..weight = (json['weight'] as num?)?.toInt()
      ..lotsize = (json['lotsize'] as num?)?.toInt()
      ..currentlotsize = (json['currentlotsize'] as num?)?.toInt()
      ..currentweight = (json['currentweight'] as num?)?.toInt()
      ..status = json['status'] as String?
      ..createdAt = json['created_at'] as String?
      ..updatedAt = json['updated_at'] as String?
      ..shopId = (json['shop_id'] as num?)?.toInt()
      ..userId = (json['user_id'] as num?)?.toInt();

Map<String, dynamic> _$GetAllTrucksResponseToJson(
        GetAllTrucksResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'number': instance.number,
      'name': instance.name,
      'items': instance.items,
      'weight': instance.weight,
      'lotsize': instance.lotsize,
      'currentlotsize': instance.currentlotsize,
      'currentweight': instance.currentweight,
      'status': instance.status,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'shop_id': instance.shopId,
      'user_id': instance.userId,
    };
