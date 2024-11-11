import 'package:basic/app/escale/models/transaction_models.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_all_transactions_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class GetAllTransactionsResponse extends Transactions{

  factory GetAllTransactionsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetAllTransactionsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetAllTransactionsResponseToJson(this);

  GetAllTransactionsResponse();
}
