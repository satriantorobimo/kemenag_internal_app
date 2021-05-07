class GetDocumentModel {
  int status;
  List<Data> data;

  GetDocumentModel({this.status, this.data});

  GetDocumentModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int id;
  int createdBy;
  String fileName;
  String group;
  String urlFile;
  String note;
  String createdAt;
  String updatedAt;
  Users users;

  Data(
      {this.id,
      this.createdBy,
      this.fileName,
      this.group,
      this.urlFile,
      this.note,
      this.createdAt,
      this.updatedAt,
      this.users});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdBy = json['created_by'];
    fileName = json['file_name'];
    group = json['group'];
    urlFile = json['url_file'];
    note = json['note'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    users = json['users'] != null ? new Users.fromJson(json['users']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['created_by'] = this.createdBy;
    data['file_name'] = this.fileName;
    data['group'] = this.group;
    data['url_file'] = this.urlFile;
    data['note'] = this.note;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.users != null) {
      data['users'] = this.users.toJson();
    }
    return data;
  }
}

class Users {
  int id;
  String name;
  String username;
  String email;

  Users({this.id, this.name, this.username, this.email});

  Users.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    username = json['username'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['username'] = this.username;
    data['email'] = this.email;
    return data;
  }
}
