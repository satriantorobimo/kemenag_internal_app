// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_forum_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListForumModel _$ListForumModelFromJson(Map<String, dynamic> json) {
  return ListForumModel(
    status: json['status'] as int,
    data: json['data'] == null
        ? null
        : Data.fromJson(json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ListForumModelToJson(ListForumModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) {
  return Data(
    current_page: json['current_page'] as int,
    data: (json['data'] as List)
        ?.map(
            (e) => e == null ? null : Datas.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    first_page_url: json['first_page_url'] as String,
    from: json['from'] as int,
    last_page: json['last_page'] as int,
    last_page_url: json['last_page_url'] as String,
    links: (json['links'] as List)
        ?.map(
            (e) => e == null ? null : Links.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    next_page_url: json['next_page_url'] as String,
    path: json['path'] as String,
    per_page: json['per_page'] as String,
    prev_page_url: json['prev_page_url'] as String,
    to: json['to'] as int,
    total: json['total'] as int,
  );
}

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'current_page': instance.current_page,
      'data': instance.data,
      'first_page_url': instance.first_page_url,
      'from': instance.from,
      'last_page': instance.last_page,
      'last_page_url': instance.last_page_url,
      'links': instance.links,
      'next_page_url': instance.next_page_url,
      'path': instance.path,
      'per_page': instance.per_page,
      'prev_page_url': instance.prev_page_url,
      'to': instance.to,
      'total': instance.total,
    };

Datas _$DatasFromJson(Map<String, dynamic> json) {
  return Datas(
    id: json['id'] as int,
    title: json['title'] as String,
    content: json['content'] as String,
    comments_count: json['comments_count'] as int,
  );
}

Map<String, dynamic> _$DatasToJson(Datas instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'content': instance.content,
      'comments_count': instance.comments_count,
    };

Links _$LinksFromJson(Map<String, dynamic> json) {
  return Links(
    url: json['url'] as String,
    label: json['label'] as String,
    active: json['active'] as bool,
  );
}

Map<String, dynamic> _$LinksToJson(Links instance) => <String, dynamic>{
      'url': instance.url,
      'label': instance.label,
      'active': instance.active,
    };
