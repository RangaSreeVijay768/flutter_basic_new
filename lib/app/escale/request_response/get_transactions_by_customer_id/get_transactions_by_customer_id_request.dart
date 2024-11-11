import 'package:json_annotation/json_annotation.dart';

import '../../models/transactions_by_customer_id_models.dart';

part 'get_transactions_by_customer_id_request.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class GetTransactionsByCustomerIdRequest{
  int? customerid;

  factory GetTransactionsByCustomerIdRequest.fromJson(
      Map<String, dynamic> json) =>
      _$GetTransactionsByCustomerIdRequestFromJson(json);

  Map<String, dynamic> toJson() =>
      _$GetTransactionsByCustomerIdRequestToJson(this);

  GetTransactionsByCustomerIdRequest({this.customerid});
}
