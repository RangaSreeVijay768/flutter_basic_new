import 'package:freezed_annotation/freezed_annotation.dart';

part 'customer_models.g.dart';

@JsonSerializable()
class CustomerModel {
  List<Customers>? customers;

  CustomerModel({this.customers});

  factory CustomerModel.fromJson(Map<String, dynamic> json) =>
      _$CustomerModelFromJson(json);

  Map<String, dynamic> toJson() => _$CustomerModelToJson(this);
}

@JsonSerializable()
class Customers {
  int? id;
  String? name;
  String? phone;
  String? altphone;
  String? email;
  String? address;
  String? createdAt;
  String? updatedAt;
  int? shopId;

  Customers(
      {this.id,
      this.name,
      this.phone,
      this.altphone,
      this.email,
      this.address,
      this.createdAt,
      this.updatedAt,
      this.shopId});

  factory Customers.fromJson(Map<String, dynamic> json) =>
      _$CustomersFromJson(json);

  Map<String, dynamic> toJson() => _$CustomersToJson(this);
}
