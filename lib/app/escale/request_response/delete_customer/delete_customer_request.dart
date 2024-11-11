import 'package:json_annotation/json_annotation.dart';

part 'delete_customer_request.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class DeleteCustomerRequest {

  factory DeleteCustomerRequest.fromJson(Map<String, dynamic> json) =>
      _$DeleteCustomerRequestFromJson(json);

  Map<String, dynamic> toJson() => _$DeleteCustomerRequestToJson(this);

  DeleteCustomerRequest();
}
