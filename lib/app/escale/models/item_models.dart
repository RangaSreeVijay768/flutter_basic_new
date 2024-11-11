import 'package:freezed_annotation/freezed_annotation.dart';

part 'item_models.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class ItemModel{
  List<Items>? items;

  ItemModel({this.items});
  
    factory ItemModel.fromJson(Map<String, dynamic> json) => _$ItemModelFromJson(json);
    
      Map<String, dynamic> toJson() => _$ItemModelToJson(this);
    
}

@JsonSerializable(fieldRename: FieldRename.snake)
class Items {
  int? id;
  String? name;
  String? price;
  String? createdAt;
  String? updatedAt;
  int? shopId;

  Items(
      {this.id,
        this.name,
        this.price,
        this.createdAt,
        this.updatedAt,
        this.shopId});

    factory Items.fromJson(Map<String, dynamic> json) => _$ItemsFromJson(json);

      Map<String, dynamic> toJson() => _$ItemsToJson(this);

}
