import 'package:json_annotation/json_annotation.dart';

part 'update_truck_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class UpdateTruckResponse {

  factory UpdateTruckResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateTruckResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateTruckResponseToJson(this);

  UpdateTruckResponse();
}
