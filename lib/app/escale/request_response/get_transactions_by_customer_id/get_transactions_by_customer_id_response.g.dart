// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_transactions_by_customer_id_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetTransactionsByCustomerIdResponse
    _$GetTransactionsByCustomerIdResponseFromJson(Map<String, dynamic> json) =>
        GetTransactionsByCustomerIdResponse()
          ..customerid = (json['customerid'] as num?)?.toInt()
          ..truckid = (json['truckid'] as num?)?.toInt()
          ..items = json['items'] as String?
          ..totalBags = json['totalBags'] as String?
          ..totalWeight = (json['totalWeight'] as num?)?.toInt()
          ..cost = (json['cost'] as num?)?.toInt();

Map<String, dynamic> _$GetTransactionsByCustomerIdResponseToJson(
        GetTransactionsByCustomerIdResponse instance) =>
    <String, dynamic>{
      'customerid': instance.customerid,
      'truckid': instance.truckid,
      'items': instance.items,
      'totalBags': instance.totalBags,
      'totalWeight': instance.totalWeight,
      'cost': instance.cost,
    };
