class AddDocumentModel {
  int status;
  String message;
  Data data;

  AddDocumentModel({this.status, this.message, this.data});

  AddDocumentModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  int createdBy;
  String fileName;
  String group;
  String urlFile;
  String note;
  String updatedAt;
  String createdAt;
  int id;

  Data(
      {this.createdBy,
      this.fileName,
      this.group,
      this.urlFile,
      this.note,
      this.updatedAt,
      this.createdAt,
      this.id});

  Data.fromJson(Map<String, dynamic> json) {
    createdBy = json['created_by'];
    fileName = json['file_name'];
    group = json['group'];
    urlFile = json['url_file'];
    note = json['note'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['created_by'] = this.createdBy;
    data['file_name'] = this.fileName;
    data['group'] = this.group;
    data['url_file'] = this.urlFile;
    data['note'] = this.note;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    return data;
  }
}
