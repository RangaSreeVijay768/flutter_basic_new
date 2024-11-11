import 'package:freezed_annotation/freezed_annotation.dart';

part 'truck_models.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class TruckModel {
  List<Trucks>? trucks;

  TruckModel({this.trucks});

  factory TruckModel.fromJson(Map<String, dynamic> json) =>
      _$TruckModelFromJson(json);

  Map<String, dynamic> toJson() => _$TruckModelToJson(this);
}

@JsonSerializable()
class Trucks {
  int? id;
  String? number;
  String? name;
  String? items;
  int? weight;
  int? lotsize;
  int? currentlotsize;
  int? currentweight;
  String? status;
  String? createdAt;
  String? updatedAt;
  int? shopId;
  int? userId;

  Trucks(
      {this.id,
      this.number,
      this.name,
      this.items,
      this.weight,
      this.lotsize,
      this.currentlotsize,
      this.currentweight,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.shopId,
      this.userId});

  factory Trucks.fromJson(Map<String, dynamic> json) => _$TrucksFromJson(json);

  Map<String, dynamic> toJson() => _$TrucksToJson(this);
}
