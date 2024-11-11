import 'package:json_annotation/json_annotation.dart';

part 'get_all_customers_request.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class GetAllCustomersRequest {

  factory GetAllCustomersRequest.fromJson(Map<String, dynamic> json) =>
      _$GetAllCustomersRequestFromJson(json);

  Map<String, dynamic> toJson() => _$GetAllCustomersRequestToJson(this);

  GetAllCustomersRequest();
}
