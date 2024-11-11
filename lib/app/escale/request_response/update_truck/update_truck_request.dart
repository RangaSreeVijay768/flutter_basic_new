import 'package:json_annotation/json_annotation.dart';

part 'update_truck_request.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class UpdateTruckRequest {

  factory UpdateTruckRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateTruckRequestFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateTruckRequestToJson(this);

  UpdateTruckRequest();
}
