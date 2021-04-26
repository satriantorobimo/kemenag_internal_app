// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginModel _$LoginModelFromJson(Map<String, dynamic> json) {
  return LoginModel(
    access_token: json['access_token'] as String,
    token_type: json['token_type'] as String,
    user: json['user'] == null
        ? null
        : User.fromJson(json['user'] as Map<String, dynamic>),
    expires_in: json['expires_in'] as int,
  );
}

Map<String, dynamic> _$LoginModelToJson(LoginModel instance) =>
    <String, dynamic>{
      'access_token': instance.access_token,
      'token_type': instance.token_type,
      'user': instance.user,
      'expires_in': instance.expires_in,
    };

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
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
  );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
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
    };
