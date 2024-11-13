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
      ..currentweight = (json['currentweight'] as num?)?.toDouble()
      ..status = json['status'] as String?
      ..createdAt = json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String)
      ..updatedAt = json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String)
      ..shopId = (json['shopId'] as num?)?.toInt()
      ..userId = (json['userId'] as num?)?.toInt();

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
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'shopId': instance.shopId,
      'userId': instance.userId,
    };
