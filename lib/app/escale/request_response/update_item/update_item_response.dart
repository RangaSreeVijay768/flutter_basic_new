import 'package:json_annotation/json_annotation.dart';

part 'update_item_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class UpdateItemResponse {

  factory UpdateItemResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateItemResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateItemResponseToJson(this);

  UpdateItemResponse();
}
