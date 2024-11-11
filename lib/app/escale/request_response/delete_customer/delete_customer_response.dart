import 'package:json_annotation/json_annotation.dart';

part 'delete_customer_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class DeleteCustomerResponse {

  factory DeleteCustomerResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteCustomerResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DeleteCustomerResponseToJson(this);

  DeleteCustomerResponse();
}
