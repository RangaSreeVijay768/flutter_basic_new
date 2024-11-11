import 'package:json_annotation/json_annotation.dart';

part 'create_customer_request.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class CreateCustomerRequest {

  factory CreateCustomerRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateCustomerRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CreateCustomerRequestToJson(this);

  CreateCustomerRequest();
}
