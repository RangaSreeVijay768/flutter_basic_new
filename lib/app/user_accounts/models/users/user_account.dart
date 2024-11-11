import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_account.g.dart';

@JsonSerializable()
class UserAccount {
  int? id;
  String? username;
  String? email;
  List<String>? roles;
  String? accessToken;
  String? refreshToken;
  List<Shops>? shops;

  UserAccount(
      {this.id,
        this.username,
        this.email,
        this.roles,
        this.accessToken,
        this.refreshToken,
        this.shops});

    factory UserAccount.fromJson(Map<String, dynamic> json) => _$UserAccountFromJson(json);

      Map<String, dynamic> toJson() => _$UserAccountToJson(this);

}


@JsonSerializable(fieldRename: FieldRename.snake)
class Shops {
  String? number;
  String? name;
  String? address;
  int? id;

  Shops({this.number, this.name, this.address, this.id});

    factory Shops.fromJson(Map<String, dynamic> json) => _$ShopsFromJson(json);

      Map<String, dynamic> toJson() => _$ShopsToJson(this);

}
