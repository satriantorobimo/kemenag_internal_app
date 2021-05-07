import 'package:json_annotation/json_annotation.dart';

part 'upload_response_model.g.dart';

@JsonSerializable(nullable: true)
class UploadFileResponse {
  int status;
  String message;
  Data data;

  UploadFileResponse({this.status, this.message, this.data});

  factory UploadFileResponse.fromJson(Map<String, dynamic> json) =>
      _$UploadFileResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UploadFileResponseToJson(this);
}

@JsonSerializable(nullable: true)
class Data {
  String fileName;
  String pathUpload;
  String baseUrl;
  String fileUrl;

  Data({this.fileName, this.pathUpload, this.baseUrl, this.fileUrl});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
