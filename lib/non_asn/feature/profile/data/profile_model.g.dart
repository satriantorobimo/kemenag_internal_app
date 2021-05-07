// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileModel _$ProfileModelFromJson(Map<String, dynamic> json) {
  return ProfileModel(
    status: json['status'] as int,
    data: json['data'] == null
        ? null
        : Data.fromJson(json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ProfileModelToJson(ProfileModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) {
  return Data(
    id: json['id'] as int,
    name: json['name'] as String,
    username: json['username'] as String,
    email: json['email'] as String,
    email_verified_at: json['email_verified_at'] as String,
    is_admin: json['is_admin'] as int,
    fcm_id: json['fcm_id'] as String,
    last_login: json['last_login'] as String,
    is_active: json['is_active'] as int,
    remember_token: json['remember_token'] as String,
    created_at: json['created_at'] as String,
    updated_at: json['updated_at'] as String,
    user_detail: json['user_detail'] == null
        ? null
        : UserDetail.fromJson(json['user_detail'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'username': instance.username,
      'email': instance.email,
      'email_verified_at': instance.email_verified_at,
      'is_admin': instance.is_admin,
      'fcm_id': instance.fcm_id,
      'last_login': instance.last_login,
      'is_active': instance.is_active,
      'remember_token': instance.remember_token,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
      'user_detail': instance.user_detail,
    };

UserDetail _$UserDetailFromJson(Map<String, dynamic> json) {
  return UserDetail(
    id: json['id'] as int,
    jenis_kelamin: json['jenis_kelamin'] as String,
    nomor_hp: json['nomor_hp'] as String,
    tanggal_lahir: json['tanggal_lahir'] as String,
    tempat_lahir: json['tempat_lahir'] as String,
    url_photo: json['url_photo'] as String,
    user_id: json['user_id'] as int,
    deleted_at: json['deleted_at'] as String,
    created_at: json['created_at'] as String,
    updated_at: json['updated_at'] as String,
  );
}

Map<String, dynamic> _$UserDetailToJson(UserDetail instance) =>
    <String, dynamic>{
      'id': instance.id,
      'jenis_kelamin': instance.jenis_kelamin,
      'nomor_hp': instance.nomor_hp,
      'tanggal_lahir': instance.tanggal_lahir,
      'tempat_lahir': instance.tempat_lahir,
      'url_photo': instance.url_photo,
      'user_id': instance.user_id,
      'deleted_at': instance.deleted_at,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
    };
