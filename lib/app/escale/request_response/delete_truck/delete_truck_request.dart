import 'package:json_annotation/json_annotation.dart';

part 'delete_truck_request.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class DeleteTruckRequest {

  factory DeleteTruckRequest.fromJson(Map<String, dynamic> json) =>
      _$DeleteTruckRequestFromJson(json);

  Map<String, dynamic> toJson() => _$DeleteTruckRequestToJson(this);

  DeleteTruckRequest();
}
