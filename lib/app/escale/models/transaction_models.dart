import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction_models.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class TransactionModel {
  List<Transactions>? transactions;

  TransactionModel({this.transactions});

  factory TransactionModel.fromJson(Map<String, dynamic> json) =>
      _$TransactionModelFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionModelToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class Transactions {
  int? id;
  String? items;
  int? bags;
  int? weight;
  String? purchasetype;
  int? price;
  String? uom;
  bool? isdeleted;
  String? enteredvia;
  String? createdAt;
  String? updatedAt;
  int? truckid;
  int? customerid;
  int? shopId;
  int? userId;
  Customer? customer;
  Truck? truck;

  Transactions(
      {this.id,
      this.items,
      this.bags,
      this.weight,
      this.purchasetype,
      this.price,
      this.uom,
      this.isdeleted,
      this.enteredvia,
      this.createdAt,
      this.updatedAt,
      this.truckid,
      this.customerid,
      this.shopId,
      this.userId,
      this.customer,
      this.truck});

  factory Transactions.fromJson(Map<String, dynamic> json) =>
      _$TransactionsFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionsToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class Customer {
  String? name;

  Customer({this.name});

  factory Customer.fromJson(Map<String, dynamic> json) =>
      _$CustomerFromJson(json);

  Map<String, dynamic> toJson() => _$CustomerToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class Truck {
  String? number;

  Truck({this.number});

  factory Truck.fromJson(Map<String, dynamic> json) => _$TruckFromJson(json);

  Map<String, dynamic> toJson() => _$TruckToJson(this);
}
