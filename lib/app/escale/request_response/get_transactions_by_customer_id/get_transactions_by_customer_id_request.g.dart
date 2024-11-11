// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_transactions_by_customer_id_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetTransactionsByCustomerIdRequest _$GetTransactionsByCustomerIdRequestFromJson(
        Map<String, dynamic> json) =>
    GetTransactionsByCustomerIdRequest(
      customerid: (json['customerid'] as num?)?.toInt(),
    );

Map<String, dynamic> _$GetTransactionsByCustomerIdRequestToJson(
        GetTransactionsByCustomerIdRequest instance) =>
    <String, dynamic>{
      'customerid': instance.customerid,
    };
