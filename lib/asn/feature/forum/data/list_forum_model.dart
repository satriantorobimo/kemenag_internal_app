import 'package:json_annotation/json_annotation.dart';
part 'list_forum_model.g.dart';

@JsonSerializable(nullable: true)
class ListForumModel {
  int status;
  Data data;

  ListForumModel({this.status, this.data});

  factory ListForumModel.fromJson(Map<String, dynamic> json) =>
      _$ListForumModelFromJson(json);

  Map<String, dynamic> toJson() => _$ListForumModelToJson(this);
}

@JsonSerializable(nullable: true)
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
  String per_page;
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

@JsonSerializable(nullable: true)
class Datas {
  int id;
  String title;
  String content;
  int comments_count;

  Datas({this.id, this.title, this.content, this.comments_count});

  factory Datas.fromJson(Map<String, dynamic> json) => _$DatasFromJson(json);

  Map<String, dynamic> toJson() => _$DatasToJson(this);
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
