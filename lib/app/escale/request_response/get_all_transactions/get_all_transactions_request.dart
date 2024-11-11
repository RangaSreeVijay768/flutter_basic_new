import 'package:json_annotation/json_annotation.dart';

part 'get_all_transactions_request.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class GetAllTransactionsRequest {

  factory GetAllTransactionsRequest.fromJson(Map<String, dynamic> json) =>
      _$GetAllTransactionsRequestFromJson(json);

  Map<String, dynamic> toJson() => _$GetAllTransactionsRequestToJson(this);

  GetAllTransactionsRequest();
}
