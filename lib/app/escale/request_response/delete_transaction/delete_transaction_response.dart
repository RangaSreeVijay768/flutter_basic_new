import 'package:json_annotation/json_annotation.dart';

part 'delete_transaction_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class DeleteTransactionResponse {

  factory DeleteTransactionResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteTransactionResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DeleteTransactionResponseToJson(this);

  DeleteTransactionResponse();
}
