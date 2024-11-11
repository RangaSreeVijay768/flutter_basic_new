import 'package:json_annotation/json_annotation.dart';

part 'update_transaction_request.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class UpdateTransactionRequest {

  factory UpdateTransactionRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateTransactionRequestFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateTransactionRequestToJson(this);

  UpdateTransactionRequest();
}
