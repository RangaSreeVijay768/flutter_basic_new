import 'package:json_annotation/json_annotation.dart';

part 'update_item_request.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class UpdateItemRequest {

  factory UpdateItemRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateItemRequestFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateItemRequestToJson(this);

  UpdateItemRequest();
}
