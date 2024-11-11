import 'package:json_annotation/json_annotation.dart';

part 'delete_item_request.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class DeleteItemRequest {

  factory DeleteItemRequest.fromJson(Map<String, dynamic> json) =>
      _$DeleteItemRequestFromJson(json);

  Map<String, dynamic> toJson() => _$DeleteItemRequestToJson(this);

  DeleteItemRequest();
}
