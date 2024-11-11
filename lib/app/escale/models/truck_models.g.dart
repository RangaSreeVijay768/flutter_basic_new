// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'truck_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TruckModel _$TruckModelFromJson(Map<String, dynamic> json) => TruckModel(
      trucks: (json['trucks'] as List<dynamic>?)
          ?.map((e) => Trucks.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TruckModelToJson(TruckModel instance) =>
    <String, dynamic>{
      'trucks': instance.trucks,
    };

Trucks _$TrucksFromJson(Map<String, dynamic> json) => Trucks(
      id: (json['id'] as num?)?.toInt(),
      number: json['number'] as String?,
      name: json['name'] as String?,
      items: json['items'] as String?,
      weight: (json['weight'] as num?)?.toInt(),
      lotsize: (json['lotsize'] as num?)?.toInt(),
      currentlotsize: (json['currentlotsize'] as num?)?.toInt(),
      currentweight: (json['currentweight'] as num?)?.toInt(),
      status: json['status'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      shopId: (json['shopId'] as num?)?.toInt(),
      userId: (json['userId'] as num?)?.toInt(),
    );

Map<String, dynamic> _$TrucksToJson(Trucks instance) => <String, dynamic>{
      'id': instance.id,
      'number': instance.number,
      'name': instance.name,
      'items': instance.items,
      'weight': instance.weight,
      'lotsize': instance.lotsize,
      'currentlotsize': instance.currentlotsize,
      'currentweight': instance.currentweight,
      'status': instance.status,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'shopId': instance.shopId,
      'userId': instance.userId,
    };
