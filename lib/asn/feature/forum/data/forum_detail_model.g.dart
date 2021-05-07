// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forum_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForumDetailModel _$ForumDetailModelFromJson(Map<String, dynamic> json) {
  return ForumDetailModel(
    status: json['status'] as int,
    data: json['data'] == null
        ? null
        : Data.fromJson(json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ForumDetailModelToJson(ForumDetailModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };

CommentsPaginate _$CommentsPaginateFromJson(Map<String, dynamic> json) {
  return CommentsPaginate(
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

Map<String, dynamic> _$CommentsPaginateToJson(CommentsPaginate instance) =>
    <String, dynamic>{
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

Data _$DataFromJson(Map<String, dynamic> json) {
  return Data(
    id: json['id'] as int,
    title: json['title'] as String,
    content: json['content'] as String,
    status: json['status'] as int,
    user_profile_id: json['user_profile_id'] as int,
    deleted_at: json['deleted_at'] as String,
    created_at: json['created_at'] as String,
    updated_at: json['updated_at'] as String,
    user: json['user'] == null
        ? null
        : User.fromJson(json['user'] as Map<String, dynamic>),
    forum_files: (json['forum_files'] as List)
        ?.map((e) =>
            e == null ? null : ForumFiles.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    comments_paginate: json['comments_paginate'] == null
        ? null
        : CommentsPaginate.fromJson(
            json['comments_paginate'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'content': instance.content,
      'status': instance.status,
      'user_profile_id': instance.user_profile_id,
      'deleted_at': instance.deleted_at,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
      'user': instance.user,
      'forum_files': instance.forum_files,
      'comments_paginate': instance.comments_paginate,
    };

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    id: json['id'] as int,
    name: json['name'] as String,
    username: json['username'] as String,
    email: json['email'] as String,
  );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'username': instance.username,
      'email': instance.email,
    };

Users _$UsersFromJson(Map<String, dynamic> json) {
  return Users(
    id: json['id'] as int,
    name: json['name'] as String,
    username: json['username'] as String,
    email: json['email'] as String,
  );
}

Map<String, dynamic> _$UsersToJson(Users instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'username': instance.username,
      'email': instance.email,
    };

CommentFiles _$CommentFilesFromJson(Map<String, dynamic> json) {
  return CommentFiles(
    id: json['id'] as int,
    file_name: json['file_name'] as String,
    url: json['url'] as String,
    fileable_type: json['fileable_type'] as String,
    fileable_id: json['fileable_id'] as int,
  );
}

Map<String, dynamic> _$CommentFilesToJson(CommentFiles instance) =>
    <String, dynamic>{
      'id': instance.id,
      'file_name': instance.file_name,
      'url': instance.url,
      'fileable_type': instance.fileable_type,
      'fileable_id': instance.fileable_id,
    };

ForumFiles _$ForumFilesFromJson(Map<String, dynamic> json) {
  return ForumFiles(
    id: json['id'] as int,
    file_name: json['file_name'] as String,
    url: json['url'] as String,
    fileable_type: json['fileable_type'] as String,
    fileable_id: json['fileable_id'] as int,
  );
}

Map<String, dynamic> _$ForumFilesToJson(ForumFiles instance) =>
    <String, dynamic>{
      'id': instance.id,
      'file_name': instance.file_name,
      'url': instance.url,
      'fileable_type': instance.fileable_type,
      'fileable_id': instance.fileable_id,
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

Datas _$DatasFromJson(Map<String, dynamic> json) {
  return Datas(
    id: json['id'] as int,
    forum_id: json['forum_id'] as int,
    user_profile_id: json['user_profile_id'] as int,
    message: json['message'] as String,
    created_at: json['created_at'] as String,
    comment_files: (json['comment_files'] as List)
        ?.map((e) =>
            e == null ? null : CommentFiles.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    user: json['user'] == null
        ? null
        : Users.fromJson(json['user'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$DatasToJson(Datas instance) => <String, dynamic>{
      'id': instance.id,
      'forum_id': instance.forum_id,
      'user_profile_id': instance.user_profile_id,
      'message': instance.message,
      'created_at': instance.created_at,
      'comment_files': instance.comment_files,
      'user': instance.user,
    };
