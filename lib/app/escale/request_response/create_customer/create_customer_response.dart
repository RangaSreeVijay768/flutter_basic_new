import 'package:json_annotation/json_annotation.dart';

part 'create_customer_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class CreateCustomerResponse {

  factory CreateCustomerResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateCustomerResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CreateCustomerResponseToJson(this);

  CreateCustomerResponse();
}
