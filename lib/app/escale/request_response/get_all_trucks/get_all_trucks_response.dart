import 'package:basic/app/escale/models/truck_models.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_all_trucks_response.g.dart';

@JsonSerializable(explicitToJson: true)
class GetAllTrucksResponse extends Trucks{

  factory GetAllTrucksResponse.fromJson(Map<String, dynamic> json) =>
      _$GetAllTrucksResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetAllTrucksResponseToJson(this);

  GetAllTrucksResponse();
}
