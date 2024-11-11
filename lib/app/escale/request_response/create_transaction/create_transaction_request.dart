import 'package:json_annotation/json_annotation.dart';

part 'create_transaction_request.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class CreateTransactionRequest {
  String? trucknumber;
  int? truckid;
  double? fullweight;
  double? weight;
  String? items;
  int? customerid;
  String? purchasetype;
  double? price;
  int? bags;

  factory CreateTransactionRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateTransactionRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CreateTransactionRequestToJson(this);

  CreateTransactionRequest(
      {this.trucknumber,
      this.truckid,
      this.fullweight,
      this.weight,
      this.items,
      this.customerid,
      this.purchasetype,
      this.price,
      this.bags});
}
