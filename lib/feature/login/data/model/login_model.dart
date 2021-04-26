import 'package:json_annotation/json_annotation.dart';
part 'login_model.g.dart';

@JsonSerializable()
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

@JsonSerializable()
class User {
  int id;
  String name;
  String username;
  String email;
  String email_verified_at;
  int is_admin;
  String fcm_id;
  String last_login;
  int is_active;
  String remember_token;
  String created_at;
  String updated_at;

  User(
      {this.id,
      this.name,
      this.username,
      this.email,
      this.email_verified_at,
      this.is_admin,
      this.fcm_id,
      this.last_login,
      this.is_active,
      this.remember_token,
      this.created_at,
      this.updated_at});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
