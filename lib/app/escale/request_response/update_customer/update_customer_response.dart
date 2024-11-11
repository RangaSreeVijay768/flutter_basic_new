import 'package:json_annotation/json_annotation.dart';

part 'update_customer_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class UpdateCustomerResponse {

  factory UpdateCustomerResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateCustomerResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateCustomerResponseToJson(this);

  UpdateCustomerResponse();
}
