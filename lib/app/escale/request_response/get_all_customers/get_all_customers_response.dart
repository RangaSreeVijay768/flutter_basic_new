import 'package:basic/app/escale/models/customer_models.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_all_customers_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class GetAllCustomersResponse extends Customers{

  factory GetAllCustomersResponse.fromJson(Map<String, dynamic> json) =>
      _$GetAllCustomersResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetAllCustomersResponseToJson(this);

  GetAllCustomersResponse();
}
