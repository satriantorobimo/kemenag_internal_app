import 'package:json_annotation/json_annotation.dart';
part 'profile_model.g.dart';

@JsonSerializable(nullable: true)
class ProfileModel {
  int status;
  Data data;

  ProfileModel({this.status, this.data});

  factory ProfileModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileModelToJson(this);
}

@JsonSerializable(nullable: true)
class Data {
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
  UserDetail user_detail;

  Data(
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
      this.updated_at,
      this.user_detail});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable(nullable: true)
class UserDetail {
  int id;
  String jenis_kelamin;
  String nomor_hp;
  String tanggal_lahir;
  String tempat_lahir;
  String url_photo;
  int user_id;
  String deleted_at;
  String created_at;
  String updated_at;

  UserDetail(
      {this.id,
      this.jenis_kelamin,
      this.nomor_hp,
      this.tanggal_lahir,
      this.tempat_lahir,
      this.url_photo,
      this.user_id,
      this.deleted_at,
      this.created_at,
      this.updated_at});

  factory UserDetail.fromJson(Map<String, dynamic> json) =>
      _$UserDetailFromJson(json);

  Map<String, dynamic> toJson() => _$UserDetailToJson(this);
}
