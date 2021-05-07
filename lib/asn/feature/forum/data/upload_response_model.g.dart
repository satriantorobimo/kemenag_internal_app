// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upload_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UploadFileResponse _$UploadFileResponseFromJson(Map<String, dynamic> json) {
  return UploadFileResponse(
    status: json['status'] as int,
    message: json['message'] as String,
    data: json['data'] == null
        ? null
        : Data.fromJson(json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$UploadFileResponseToJson(UploadFileResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) {
  return Data(
    fileName: json['fileName'] as String,
    pathUpload: json['pathUpload'] as String,
    baseUrl: json['baseUrl'] as String,
    fileUrl: json['fileUrl'] as String,
  );
}

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'fileName': instance.fileName,
      'pathUpload': instance.pathUpload,
      'baseUrl': instance.baseUrl,
      'fileUrl': instance.fileUrl,
    };
