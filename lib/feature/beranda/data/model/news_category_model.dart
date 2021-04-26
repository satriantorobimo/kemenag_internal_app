import 'package:json_annotation/json_annotation.dart';
part 'news_category_model.g.dart';

@JsonSerializable()
class NewsCategoryModel {
  int status;
  Data data;

  NewsCategoryModel({this.status, this.data});

  factory NewsCategoryModel.fromJson(Map<String, dynamic> json) =>
      _$NewsCategoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$NewsCategoryModelToJson(this);
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
  String name;

  String deleted_at;
  String created_at;
  String updated_at;

  Datas(
      {this.id, this.name, this.deleted_at, this.created_at, this.updated_at});

  factory Datas.fromJson(Map<String, dynamic> json) => _$DatasFromJson(json);

  Map<String, dynamic> toJson() => _$DatasToJson(this);
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
