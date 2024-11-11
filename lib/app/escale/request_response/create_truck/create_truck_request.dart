import 'package:json_annotation/json_annotation.dart';

import '../../models/item_models.dart';

part 'create_truck_request.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class CreateTruckRequest {
  String? number;
  String? name;
  String? weight;
  String? lotsize;
  String? items;

  factory CreateTruckRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateTruckRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CreateTruckRequestToJson(this);

  CreateTruckRequest(
      {this.number, this.name, this.weight, this.lotsize, this.items});
}
