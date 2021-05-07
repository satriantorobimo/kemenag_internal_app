import 'package:json_annotation/json_annotation.dart';
part 'forum_detail_model.g.dart';

@JsonSerializable(nullable: true)
class ForumDetailModel {
  int status;
  Data data;

  ForumDetailModel({this.status, this.data});

  factory ForumDetailModel.fromJson(Map<String, dynamic> json) =>
      _$ForumDetailModelFromJson(json);

  Map<String, dynamic> toJson() => _$ForumDetailModelToJson(this);
}

@JsonSerializable(nullable: true)
class CommentsPaginate {
  int current_page;
  List<Datas> data;
  String first_page_url;
  int from;
  int last_page;
  String last_page_url;
  List<Links> links;
  String next_page_url;
  String path;
  String per_page;
  String prev_page_url;
  int to;
  int total;

  CommentsPaginate(
      {this.current_page,
      this.data,
      this.first_page_url,
      this.from,
      this.last_page,
      this.last_page_url,
      this.links,
      this.next_page_url,
      this.path,
      this.per_page,
      this.prev_page_url,
      this.to,
      this.total});

  factory CommentsPaginate.fromJson(Map<String, dynamic> json) =>
      _$CommentsPaginateFromJson(json);

  Map<String, dynamic> toJson() => _$CommentsPaginateToJson(this);
}

@JsonSerializable(nullable: true)
class Data {
  int id;
  String title;
  String content;
  int status;
  int user_profile_id;
  String deleted_at;
  String created_at;
  String updated_at;
  User user;
  List<ForumFiles> forum_files;
  CommentsPaginate comments_paginate;

  Data(
      {this.id,
      this.title,
      this.content,
      this.status,
      this.user_profile_id,
      this.deleted_at,
      this.created_at,
      this.updated_at,
      this.user,
      this.forum_files,
      this.comments_paginate});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable(nullable: true)
class User {
  int id;
  String name;
  String username;
  String email;

  User({this.id, this.name, this.username, this.email});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}

@JsonSerializable(nullable: true)
class Users {
  int id;
  String name;
  String username;
  String email;

  Users({this.id, this.name, this.username, this.email});

  factory Users.fromJson(Map<String, dynamic> json) => _$UsersFromJson(json);

  Map<String, dynamic> toJson() => _$UsersToJson(this);
}

@JsonSerializable(nullable: true)
class CommentFiles {
  int id;
  String file_name;
  String url;
  String fileable_type;
  int fileable_id;

  CommentFiles(
      {this.id,
      this.file_name,
      this.url,
      this.fileable_type,
      this.fileable_id});

  factory CommentFiles.fromJson(Map<String, dynamic> json) =>
      _$CommentFilesFromJson(json);

  Map<String, dynamic> toJson() => _$CommentFilesToJson(this);
}

@JsonSerializable(nullable: true)
class ForumFiles {
  int id;
  String file_name;
  String url;
  String fileable_type;
  int fileable_id;

  ForumFiles(
      {this.id,
      this.file_name,
      this.url,
      this.fileable_type,
      this.fileable_id});

  factory ForumFiles.fromJson(Map<String, dynamic> json) =>
      _$ForumFilesFromJson(json);

  Map<String, dynamic> toJson() => _$ForumFilesToJson(this);
}

@JsonSerializable(nullable: true)
class Links {
  String url;
  String label;
  bool active;

  Links({this.url, this.label, this.active});

  factory Links.fromJson(Map<String, dynamic> json) => _$LinksFromJson(json);

  Map<String, dynamic> toJson() => _$LinksToJson(this);
}

@JsonSerializable(nullable: true)
class Datas {
  int id;
  int forum_id;
  int user_profile_id;
  String message;
  String created_at;
  List<CommentFiles> comment_files;
  Users user;

  Datas(
      {this.id,
      this.forum_id,
      this.user_profile_id,
      this.message,
      this.created_at,
      this.comment_files,
      this.user});

  factory Datas.fromJson(Map<String, dynamic> json) => _$DatasFromJson(json);

  Map<String, dynamic> toJson() => _$DatasToJson(this);
}
