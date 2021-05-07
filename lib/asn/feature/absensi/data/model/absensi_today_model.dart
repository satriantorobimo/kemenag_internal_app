class AbsensiTodayModel {
  int status;
  Data data;

  AbsensiTodayModel({this.status, this.data});

  AbsensiTodayModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  String masuk;
  String keluar;
  String nip;
  String nipbaru;
  String namalengkap;
  String tampiljabatan;

  Data(
      {this.masuk,
      this.keluar,
      this.nip,
      this.nipbaru,
      this.namalengkap,
      this.tampiljabatan});

  Data.fromJson(Map<String, dynamic> json) {
    masuk = json['masuk'];
    keluar = json['keluar'];
    nip = json['NIP'];
    nipbaru = json['NIP_BARU'];
    namalengkap = json['NAMA_LENGKAP'];
    tampiljabatan = json['TAMPIL_JABATAN'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['masuk'] = this.masuk;
    data['keluar'] = this.keluar;
    data['NIP'] = this.nip;
    data['NIP_BARU'] = this.nipbaru;
    data['NAMA_LENGKAP'] = this.namalengkap;
    data['TAMPIL_JABATAN'] = this.tampiljabatan;
    return data;
  }
}
