// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomerModel _$CustomerModelFromJson(Map<String, dynamic> json) =>
    CustomerModel(
      customers: (json['customers'] as List<dynamic>?)
          ?.map((e) => Customers.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CustomerModelToJson(CustomerModel instance) =>
    <String, dynamic>{
      'customers': instance.customers,
    };

Customers _$CustomersFromJson(Map<String, dynamic> json) => Customers(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      phone: json['phone'] as String?,
      altphone: json['altphone'] as String?,
      email: json['email'] as String?,
      address: json['address'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      shopId: (json['shopId'] as num?)?.toInt(),
    );

Map<String, dynamic> _$CustomersToJson(Customers instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'phone': instance.phone,
      'altphone': instance.altphone,
      'email': instance.email,
      'address': instance.address,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'shopId': instance.shopId,
    };
