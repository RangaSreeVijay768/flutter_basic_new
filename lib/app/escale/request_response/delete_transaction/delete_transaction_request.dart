import 'package:json_annotation/json_annotation.dart';

part 'delete_transaction_request.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class DeleteTransactionRequest {

  factory DeleteTransactionRequest.fromJson(Map<String, dynamic> json) =>
      _$DeleteTransactionRequestFromJson(json);

  Map<String, dynamic> toJson() => _$DeleteTransactionRequestToJson(this);

  DeleteTransactionRequest();
}
