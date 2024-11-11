import 'package:json_annotation/json_annotation.dart';

part 'get_all_items_request.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class GetAllItemsRequest{

  factory GetAllItemsRequest.fromJson(Map<String, dynamic> json) =>
      _$GetAllItemsRequestFromJson(json);

  Map<String, dynamic> toJson() => _$GetAllItemsRequestToJson(this);

  GetAllItemsRequest();
}
