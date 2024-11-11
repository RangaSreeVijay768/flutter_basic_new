import 'package:json_annotation/json_annotation.dart';

import '../../models/transactions_by_customer_id_models.dart';

part 'get_transactions_by_customer_id_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class GetTransactionsByCustomerIdResponse  extends TransactionsByCustomerIdModels{

  factory GetTransactionsByCustomerIdResponse.fromJson(
      Map<String, dynamic> json) =>
      _$GetTransactionsByCustomerIdResponseFromJson(json);

  Map<String, dynamic> toJson() =>
      _$GetTransactionsByCustomerIdResponseToJson(this);

  GetTransactionsByCustomerIdResponse();
}
