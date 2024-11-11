import 'package:basic/app/escale/models/item_models.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_all_items_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class GetAllItemsResponse extends Items{

  factory GetAllItemsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetAllItemsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetAllItemsResponseToJson(this);

  GetAllItemsResponse();
}
