class AbsensiMonthlyModel {
  int status;
  List<Data> data;

  AbsensiMonthlyModel({this.status, this.data});

  AbsensiMonthlyModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <Data>[];
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
  String dt;
  String nday;
  int daynumber;
  int nholiday;
  String badgenumber;
  String name;
  int tgl;
  String checkIn;
  String jamMsk;
  int hitJamMsk;
  int parJamMasuk;
  String checkOut;
  String jamPlg;
  int hitJamPlg;
  int parJamPlg;
  String remark;
  String attachment;
  String absType;
  String refDesc;
  String liburDesc;
  String uangMakan;
  String uangMakanBersih;

  Data(
      {this.dt,
      this.nday,
      this.daynumber,
      this.nholiday,
      this.badgenumber,
      this.name,
      this.tgl,
      this.checkIn,
      this.jamMsk,
      this.hitJamMsk,
      this.parJamMasuk,
      this.checkOut,
      this.jamPlg,
      this.hitJamPlg,
      this.parJamPlg,
      this.remark,
      this.attachment,
      this.absType,
      this.refDesc,
      this.liburDesc,
      this.uangMakan,
      this.uangMakanBersih});

  Data.fromJson(Map<String, dynamic> json) {
    dt = json['dt'];
    nday = json['nday'];
    daynumber = json['daynumber'];
    nholiday = json['nholiday'];
    badgenumber = json['badgenumber'];
    name = json['name'];
    tgl = json['tgl'];
    checkIn = json['check_in'];
    jamMsk = json['jam_msk'];
    hitJamMsk = json['hit_jam_msk'];
    parJamMasuk = json['par_jam_masuk'];
    checkOut = json['check_out'];
    jamPlg = json['jam_plg'];
    hitJamPlg = json['hit_jam_plg'];
    parJamPlg = json['par_jam_plg'];
    remark = json['remark'];
    attachment = json['attachment'];
    absType = json['abs_type'];
    refDesc = json['ref_desc'];
    liburDesc = json['libur_desc'];
    uangMakan = json['uang_makan'];
    uangMakanBersih = json['uang_makan_bersih'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['dt'] = this.dt;
    data['nday'] = this.nday;
    data['daynumber'] = this.daynumber;
    data['nholiday'] = this.nholiday;
    data['badgenumber'] = this.badgenumber;
    data['name'] = this.name;
    data['tgl'] = this.tgl;
    data['check_in'] = this.checkIn;
    data['jam_msk'] = this.jamMsk;
    data['hit_jam_msk'] = this.hitJamMsk;
    data['par_jam_masuk'] = this.parJamMasuk;
    data['check_out'] = this.checkOut;
    data['jam_plg'] = this.jamPlg;
    data['hit_jam_plg'] = this.hitJamPlg;
    data['par_jam_plg'] = this.parJamPlg;
    data['remark'] = this.remark;
    data['attachment'] = this.attachment;
    data['abs_type'] = this.absType;
    data['ref_desc'] = this.refDesc;
    data['libur_desc'] = this.liburDesc;
    data['uang_makan'] = this.uangMakan;
    data['uang_makan_bersih'] = this.uangMakanBersih;
    return data;
  }
}
