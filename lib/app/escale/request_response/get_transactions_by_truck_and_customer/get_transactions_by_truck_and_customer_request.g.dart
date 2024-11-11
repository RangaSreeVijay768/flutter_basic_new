// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_transactions_by_truck_and_customer_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetTransactionsByTruckAndCustomerRequest
    _$GetTransactionsByTruckAndCustomerRequestFromJson(
            Map<String, dynamic> json) =>
        GetTransactionsByTruckAndCustomerRequest(
          customerid: (json['customerid'] as num?)?.toInt(),
          truckid: (json['truckid'] as num?)?.toInt(),
        );

Map<String, dynamic> _$GetTransactionsByTruckAndCustomerRequestToJson(
        GetTransactionsByTruckAndCustomerRequest instance) =>
    <String, dynamic>{
      'customerid': instance.customerid,
      'truckid': instance.truckid,
    };
