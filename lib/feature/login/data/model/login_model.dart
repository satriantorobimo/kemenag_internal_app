import 'package:json_annotation/json_annotation.dart';
part 'login_model.g.dart';

@JsonSerializable(nullable: true)
class LoginModel {
  String access_token;
  String token_type;
  User user;
  int expires_in;

  LoginModel({this.access_token, this.token_type, this.user, this.expires_in});

  factory LoginModel.fromJson(Map<String, dynamic> json) =>
      _$LoginModelFromJson(json);

  Map<String, dynamic> toJson() => _$LoginModelToJson(this);
}

@JsonSerializable(nullable: true)
class User {
  int id;
  String username;
  String email;

  User({
    this.id,
    this.username,
    this.email,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
