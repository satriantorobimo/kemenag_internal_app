import 'package:json_annotation/json_annotation.dart';
part 'news_model.g.dart';

@JsonSerializable()
class NewsModel {
  int status;
  Data data;

  NewsModel({this.status, this.data});

  factory NewsModel.fromJson(Map<String, dynamic> json) =>
      _$NewsModelFromJson(json);

  Map<String, dynamic> toJson() => _$NewsModelToJson(this);
}

@JsonSerializable()
class Data {
  int current_page;
  List<Datas> data;
  String first_page_url;
  int from;
  int last_page;
  String last_page_url;
  List<Links> links;
  String next_page_url;
  String path;
  int per_page;
  String prev_page_url;
  int to;
  int total;

  Data(
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

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class Datas {
  int id;
  String title;
  String content;
  int news_category_id;
  String photo;
  String url_photo;
  String caption_image;
  int status;
  int viewer;
  String date_schedule;
  String deleted_at;
  String created_at;
  String updated_at;
  NewsCategory news_category;

  Datas(
      {this.id,
      this.title,
      this.content,
      this.news_category_id,
      this.photo,
      this.url_photo,
      this.caption_image,
      this.status,
      this.viewer,
      this.date_schedule,
      this.deleted_at,
      this.created_at,
      this.updated_at,
      this.news_category});

  factory Datas.fromJson(Map<String, dynamic> json) => _$DatasFromJson(json);

  Map<String, dynamic> toJson() => _$DatasToJson(this);
}

@JsonSerializable()
class NewsCategory {
  int id;
  String name;
  String created_at;
  String updated_at;
  String deleted_at;

  NewsCategory(
      {this.id, this.name, this.created_at, this.updated_at, this.deleted_at});

  factory NewsCategory.fromJson(Map<String, dynamic> json) =>
      _$NewsCategoryFromJson(json);

  Map<String, dynamic> toJson() => _$NewsCategoryToJson(this);
}

@JsonSerializable()
class Links {
  String url;
  String label;
  bool active;

  Links({this.url, this.label, this.active});

  factory Links.fromJson(Map<String, dynamic> json) => _$LinksFromJson(json);

  Map<String, dynamic> toJson() => _$LinksToJson(this);
}
