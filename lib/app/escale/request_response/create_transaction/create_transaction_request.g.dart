// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_transaction_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateTransactionRequest _$CreateTransactionRequestFromJson(
        Map<String, dynamic> json) =>
    CreateTransactionRequest(
      trucknumber: json['trucknumber'] as String?,
      truckid: (json['truckid'] as num?)?.toInt(),
      fullweight: (json['fullweight'] as num?)?.toDouble(),
      weight: (json['weight'] as num?)?.toDouble(),
      items: json['items'] as String?,
      customerid: (json['customerid'] as num?)?.toInt(),
      purchasetype: json['purchasetype'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      bags: (json['bags'] as num?)?.toInt(),
    );

Map<String, dynamic> _$CreateTransactionRequestToJson(
        CreateTransactionRequest instance) =>
    <String, dynamic>{
      'trucknumber': instance.trucknumber,
      'truckid': instance.truckid,
      'fullweight': instance.fullweight,
      'weight': instance.weight,
      'items': instance.items,
      'customerid': instance.customerid,
      'purchasetype': instance.purchasetype,
      'price': instance.price,
      'bags': instance.bags,
    };
