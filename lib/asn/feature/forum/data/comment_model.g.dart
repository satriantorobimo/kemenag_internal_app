// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ComentModel _$ComentModelFromJson(Map<String, dynamic> json) {
  return ComentModel(
    status: json['status'] as int,
    message: json['message'] as String,
    data: json['data'] == null
        ? null
        : Data.fromJson(json['data'] as Map<String, dynamic>),
    id: json['id'] as int,
  );
}

Map<String, dynamic> _$ComentModelToJson(ComentModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
      'id': instance.id,
    };

Data _$DataFromJson(Map<String, dynamic> json) {
  return Data(
    forum_id: json['forum_id'] as int,
    user_profile_id: json['user_profile_id'] as int,
    message: json['message'] as String,
    updated_at: json['updated_at'] as String,
    created_at: json['created_at'] as String,
    id: json['id'] as int,
  );
}

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'forum_id': instance.forum_id,
      'user_profile_id': instance.user_profile_id,
      'message': instance.message,
      'updated_at': instance.updated_at,
      'created_at': instance.created_at,
      'id': instance.id,
    };
