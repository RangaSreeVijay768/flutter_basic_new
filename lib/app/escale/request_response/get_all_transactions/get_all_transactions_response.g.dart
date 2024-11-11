// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_transactions_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllTransactionsResponse _$GetAllTransactionsResponseFromJson(
        Map<String, dynamic> json) =>
    GetAllTransactionsResponse()
      ..id = (json['id'] as num?)?.toInt()
      ..items = json['items'] as String?
      ..bags = (json['bags'] as num?)?.toInt()
      ..weight = (json['weight'] as num?)?.toInt()
      ..purchasetype = json['purchasetype'] as String?
      ..price = (json['price'] as num?)?.toInt()
      ..uom = json['uom'] as String?
      ..isdeleted = json['isdeleted'] as bool?
      ..enteredvia = json['enteredvia'] as String?
      ..createdAt = json['created_at'] as String?
      ..updatedAt = json['updated_at'] as String?
      ..truckid = (json['truckid'] as num?)?.toInt()
      ..customerid = (json['customerid'] as num?)?.toInt()
      ..shopId = (json['shop_id'] as num?)?.toInt()
      ..userId = (json['user_id'] as num?)?.toInt()
      ..customer = json['customer'] == null
          ? null
          : Customer.fromJson(json['customer'] as Map<String, dynamic>)
      ..truck = json['truck'] == null
          ? null
          : Truck.fromJson(json['truck'] as Map<String, dynamic>);

Map<String, dynamic> _$GetAllTransactionsResponseToJson(
        GetAllTransactionsResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'items': instance.items,
      'bags': instance.bags,
      'weight': instance.weight,
      'purchasetype': instance.purchasetype,
      'price': instance.price,
      'uom': instance.uom,
      'isdeleted': instance.isdeleted,
      'enteredvia': instance.enteredvia,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'truckid': instance.truckid,
      'customerid': instance.customerid,
      'shop_id': instance.shopId,
      'user_id': instance.userId,
      'customer': instance.customer?.toJson(),
      'truck': instance.truck?.toJson(),
    };
