// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_truck_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateTruckRequest _$CreateTruckRequestFromJson(Map<String, dynamic> json) =>
    CreateTruckRequest(
      number: json['number'] as String?,
      name: json['name'] as String?,
      weight: json['weight'] as String?,
      lotsize: json['lotsize'] as String?,
      items: json['items'] as String?,
    );

Map<String, dynamic> _$CreateTruckRequestToJson(CreateTruckRequest instance) =>
    <String, dynamic>{
      'number': instance.number,
      'name': instance.name,
      'weight': instance.weight,
      'lotsize': instance.lotsize,
      'items': instance.items,
    };
