import 'package:json_annotation/json_annotation.dart';
part 'comment_model.g.dart';

@JsonSerializable(nullable: true)
class ComentModel {
  int status;
  String message;
  Data data;
  int id;

  ComentModel({this.status, this.message, this.data, this.id});

  factory ComentModel.fromJson(Map<String, dynamic> json) =>
      _$ComentModelFromJson(json);

  Map<String, dynamic> toJson() => _$ComentModelToJson(this);
}

@JsonSerializable(nullable: true)
class Data {
  int forum_id;
  int user_profile_id;
  String message;
  String updated_at;
  String created_at;
  int id;

  Data(
      {this.forum_id,
      this.user_profile_id,
      this.message,
      this.updated_at,
      this.created_at,
      this.id});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
