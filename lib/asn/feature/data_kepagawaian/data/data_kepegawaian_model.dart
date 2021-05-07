class DataKepegawaianModel {
  int status;
  Data data;

  DataKepegawaianModel({this.status, this.data});

  DataKepegawaianModel.fromJson(Map<String, dynamic> json) {
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
  List<Datas> data;

  Data({this.data});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = List<Datas>();
      json['data'].forEach((v) {
        data.add(Datas.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Datas {
  String label;
  List<Value> value;

  Datas({this.label, this.value});

  Datas.fromJson(Map<String, dynamic> json) {
    label = json['label'];
    if (json['value'] != null) {
      value = new List<Value>();
      json['value'].forEach((v) {
        value.add(new Value.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['label'] = this.label;
    if (this.value != null) {
      data['value'] = this.value.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Value {
  String nIP;
  String nIPBARU;
  String nAMA;
  String nAMALENGKAP;
  String aGAMA;
  String tEMPATLAHIR;
  String tANGGALLAHIR;
  int jENISKELAMIN;
  String pENDIDIKAN;
  String kODELEVELJABATAN;
  String lEVELJABATAN;
  String pANGKAT;
  String gOLRUANG;
  String tMTCPNS;
  String tMTPANGKAT;
  int mASAKERJATAHUN;
  int mASAKERJABULAN;
  String tIPEJABATAN;
  String kODEJABATAN;
  String tAMPILJABATAN;
  String tMTJABATAN;
  String kODESATKER1;
  String sATKER1;
  String kODESATKER2;
  String sATKER2;
  String kODESATKER3;
  String sATKER3;
  String kODESATKER4;
  String sATKER4;
  String kODESATKER5;
  String sATKER5;
  String sATUANKERJA;
  String sTATUSKAWIN;
  String aLAMAT1;
  String aLAMAT2;
  String tELEPON;
  String kABKOTA;
  String pROVINSI;
  String kODEPOS;
  String kODELOKASI;
  String kODEPANGKAT;
  String nOHP;
  String eMAIL;
  String tMTPANGKATYAD;
  String tMTKGBYAD;
  String tMTPENSIUN;
  int nOURUT;
  String nAMASEKOLAH;
  String fAKULTASPENDIDIKAN;
  String jURUSAN;
  String tAHUNLULUS;
  String jENJANGPENDIDIKAN;
  String lOKASISEKOLAH;
  String aKTA;
  String jABATAN;
  String kODEBIDANGSTUDI;
  String bIDANGSTUDI;
  String kODESATUANKERJA;
  String kETERANGANSATUANKERJA;
  String nOSK;
  String tGLSK;
  String tMTSK;
  String kODEJABATAN2;
  String jABATAN2;
  String kODESATUANKERJA2;
  String sATUANKERJA2;
  String kETERANGANSATUANKERJA2;
  String nOSK2;
  String tGLSK2;
  String tMTSK2;
  String kETERANGAN;
  int mKTAHUN;
  int mKBULAN;

  Value(
      {this.nIP,
      this.nIPBARU,
      this.nAMA,
      this.nAMALENGKAP,
      this.aGAMA,
      this.tEMPATLAHIR,
      this.tANGGALLAHIR,
      this.jENISKELAMIN,
      this.pENDIDIKAN,
      this.kODELEVELJABATAN,
      this.lEVELJABATAN,
      this.pANGKAT,
      this.gOLRUANG,
      this.tMTCPNS,
      this.tMTPANGKAT,
      this.mASAKERJATAHUN,
      this.mASAKERJABULAN,
      this.tIPEJABATAN,
      this.kODEJABATAN,
      this.tAMPILJABATAN,
      this.tMTJABATAN,
      this.kODESATKER1,
      this.sATKER1,
      this.kODESATKER2,
      this.sATKER2,
      this.kODESATKER3,
      this.sATKER3,
      this.kODESATKER4,
      this.sATKER4,
      this.kODESATKER5,
      this.sATKER5,
      this.sATUANKERJA,
      this.sTATUSKAWIN,
      this.aLAMAT1,
      this.aLAMAT2,
      this.tELEPON,
      this.kABKOTA,
      this.pROVINSI,
      this.kODEPOS,
      this.kODELOKASI,
      this.kODEPANGKAT,
      this.nOHP,
      this.eMAIL,
      this.tMTPANGKATYAD,
      this.tMTKGBYAD,
      this.tMTPENSIUN,
      this.nOURUT,
      this.nAMASEKOLAH,
      this.fAKULTASPENDIDIKAN,
      this.jURUSAN,
      this.tAHUNLULUS,
      this.jENJANGPENDIDIKAN,
      this.lOKASISEKOLAH,
      this.aKTA,
      this.jABATAN,
      this.kODEBIDANGSTUDI,
      this.bIDANGSTUDI,
      this.kODESATUANKERJA,
      this.kETERANGANSATUANKERJA,
      this.nOSK,
      this.tGLSK,
      this.tMTSK,
      this.kODEJABATAN2,
      this.jABATAN2,
      this.kODESATUANKERJA2,
      this.sATUANKERJA2,
      this.kETERANGANSATUANKERJA2,
      this.nOSK2,
      this.tGLSK2,
      this.tMTSK2,
      this.kETERANGAN,
      this.mKTAHUN,
      this.mKBULAN});

  Value.fromJson(Map<String, dynamic> json) {
    nIP = json['NIP'];
    nIPBARU = json['NIP_BARU'];
    nAMA = json['NAMA'];
    nAMALENGKAP = json['NAMA_LENGKAP'];
    aGAMA = json['AGAMA'];
    tEMPATLAHIR = json['TEMPAT_LAHIR'];
    tANGGALLAHIR = json['TANGGAL_LAHIR'];
    jENISKELAMIN = json['JENIS_KELAMIN'];
    pENDIDIKAN = json['PENDIDIKAN'];
    kODELEVELJABATAN = json['KODE_LEVEL_JABATAN'];
    lEVELJABATAN = json['LEVEL_JABATAN'];
    pANGKAT = json['PANGKAT'];
    gOLRUANG = json['GOL_RUANG'];
    tMTCPNS = json['TMT_CPNS'];
    tMTPANGKAT = json['TMT_PANGKAT'];
    mASAKERJATAHUN = json['MASAKERJA_TAHUN'];
    mASAKERJABULAN = json['MASAKERJA_BULAN'];
    tIPEJABATAN = json['TIPE_JABATAN'];
    kODEJABATAN = json['KODE_JABATAN'];
    tAMPILJABATAN = json['TAMPIL_JABATAN'];
    tMTJABATAN = json['TMT_JABATAN'];
    kODESATKER1 = json['KODE_SATKER_1'];
    sATKER1 = json['SATKER_1'];
    kODESATKER2 = json['KODE_SATKER_2'];
    sATKER2 = json['SATKER_2'];
    kODESATKER3 = json['KODE_SATKER_3'];
    sATKER3 = json['SATKER_3'];
    kODESATKER4 = json['KODE_SATKER_4'];
    sATKER4 = json['SATKER_4'];
    kODESATKER5 = json['KODE_SATKER_5'];
    sATKER5 = json['SATKER_5'];
    sATUANKERJA = json['SATUAN_KERJA'];
    sTATUSKAWIN = json['STATUS_KAWIN'];
    aLAMAT1 = json['ALAMAT_1'];
    aLAMAT2 = json['ALAMAT_2'];
    tELEPON = json['TELEPON'];
    kABKOTA = json['KAB_KOTA'];
    pROVINSI = json['PROVINSI'];
    kODEPOS = json['KODE_POS'];
    kODELOKASI = json['KODE_LOKASI'];
    kODEPANGKAT = json['KODE_PANGKAT'];
    nOHP = json['NO_HP'];
    eMAIL = json['EMAIL'];
    tMTPANGKATYAD = json['TMT_PANGKAT_YAD'];
    tMTKGBYAD = json['TMT_KGB_YAD'];
    tMTPENSIUN = json['TMT_PENSIUN'];
    nOURUT = json['NO_URUT'];
    nAMASEKOLAH = json['NAMA_SEKOLAH'];
    fAKULTASPENDIDIKAN = json['FAKULTAS_PENDIDIKAN'];
    jURUSAN = json['JURUSAN'];
    tAHUNLULUS = json['TAHUN_LULUS'];
    jENJANGPENDIDIKAN = json['JENJANG_PENDIDIKAN'];
    lOKASISEKOLAH = json['LOKASI_SEKOLAH'];
    aKTA = json['AKTA'];
    jABATAN = json['JABATAN'];
    kODEBIDANGSTUDI = json['KODE_BIDANG_STUDI'];
    bIDANGSTUDI = json['BIDANG_STUDI'];
    kODESATUANKERJA = json['KODE_SATUAN_KERJA'];
    kETERANGANSATUANKERJA = json['KETERANGAN_SATUAN_KERJA'];
    nOSK = json['NO_SK'];
    tGLSK = json['TGL_SK'];
    tMTSK = json['TMT_SK'];
    kODEJABATAN2 = json['KODE_JABATAN_2'];
    jABATAN2 = json['JABATAN_2'];
    kODESATUANKERJA2 = json['KODE_SATUAN_KERJA_2'];
    sATUANKERJA2 = json['SATUAN_KERJA_2'];
    kETERANGANSATUANKERJA2 = json['KETERANGAN_SATUAN_KERJA_2'];
    nOSK2 = json['NO_SK_2'];
    tGLSK2 = json['TGL_SK_2'];
    tMTSK2 = json['TMT_SK_2'];
    kETERANGAN = json['KETERANGAN'];
    mKTAHUN = json['MK_TAHUN'];
    mKBULAN = json['MK_BULAN'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['NIP'] = this.nIP;
    data['NIP_BARU'] = this.nIPBARU;
    data['NAMA'] = this.nAMA;
    data['NAMA_LENGKAP'] = this.nAMALENGKAP;
    data['AGAMA'] = this.aGAMA;
    data['TEMPAT_LAHIR'] = this.tEMPATLAHIR;
    data['TANGGAL_LAHIR'] = this.tANGGALLAHIR;
    data['JENIS_KELAMIN'] = this.jENISKELAMIN;
    data['PENDIDIKAN'] = this.pENDIDIKAN;
    data['KODE_LEVEL_JABATAN'] = this.kODELEVELJABATAN;
    data['LEVEL_JABATAN'] = this.lEVELJABATAN;
    data['PANGKAT'] = this.pANGKAT;
    data['GOL_RUANG'] = this.gOLRUANG;
    data['TMT_CPNS'] = this.tMTCPNS;
    data['TMT_PANGKAT'] = this.tMTPANGKAT;
    data['MASAKERJA_TAHUN'] = this.mASAKERJATAHUN;
    data['MASAKERJA_BULAN'] = this.mASAKERJABULAN;
    data['TIPE_JABATAN'] = this.tIPEJABATAN;
    data['KODE_JABATAN'] = this.kODEJABATAN;
    data['TAMPIL_JABATAN'] = this.tAMPILJABATAN;
    data['TMT_JABATAN'] = this.tMTJABATAN;
    data['KODE_SATKER_1'] = this.kODESATKER1;
    data['SATKER_1'] = this.sATKER1;
    data['KODE_SATKER_2'] = this.kODESATKER2;
    data['SATKER_2'] = this.sATKER2;
    data['KODE_SATKER_3'] = this.kODESATKER3;
    data['SATKER_3'] = this.sATKER3;
    data['KODE_SATKER_4'] = this.kODESATKER4;
    data['SATKER_4'] = this.sATKER4;
    data['KODE_SATKER_5'] = this.kODESATKER5;
    data['SATKER_5'] = this.sATKER5;
    data['SATUAN_KERJA'] = this.sATUANKERJA;
    data['STATUS_KAWIN'] = this.sTATUSKAWIN;
    data['ALAMAT_1'] = this.aLAMAT1;
    data['ALAMAT_2'] = this.aLAMAT2;
    data['TELEPON'] = this.tELEPON;
    data['KAB_KOTA'] = this.kABKOTA;
    data['PROVINSI'] = this.pROVINSI;
    data['KODE_POS'] = this.kODEPOS;
    data['KODE_LOKASI'] = this.kODELOKASI;
    data['KODE_PANGKAT'] = this.kODEPANGKAT;
    data['NO_HP'] = this.nOHP;
    data['EMAIL'] = this.eMAIL;
    data['TMT_PANGKAT_YAD'] = this.tMTPANGKATYAD;
    data['TMT_KGB_YAD'] = this.tMTKGBYAD;
    data['TMT_PENSIUN'] = this.tMTPENSIUN;
    data['NO_URUT'] = this.nOURUT;
    data['NAMA_SEKOLAH'] = this.nAMASEKOLAH;
    data['FAKULTAS_PENDIDIKAN'] = this.fAKULTASPENDIDIKAN;
    data['JURUSAN'] = this.jURUSAN;
    data['TAHUN_LULUS'] = this.tAHUNLULUS;
    data['JENJANG_PENDIDIKAN'] = this.jENJANGPENDIDIKAN;
    data['LOKASI_SEKOLAH'] = this.lOKASISEKOLAH;
    data['AKTA'] = this.aKTA;
    data['JABATAN'] = this.jABATAN;
    data['KODE_BIDANG_STUDI'] = this.kODEBIDANGSTUDI;
    data['BIDANG_STUDI'] = this.bIDANGSTUDI;
    data['KODE_SATUAN_KERJA'] = this.kODESATUANKERJA;
    data['KETERANGAN_SATUAN_KERJA'] = this.kETERANGANSATUANKERJA;
    data['NO_SK'] = this.nOSK;
    data['TGL_SK'] = this.tGLSK;
    data['TMT_SK'] = this.tMTSK;
    data['KODE_JABATAN_2'] = this.kODEJABATAN2;
    data['JABATAN_2'] = this.jABATAN2;
    data['KODE_SATUAN_KERJA_2'] = this.kODESATUANKERJA2;
    data['SATUAN_KERJA_2'] = this.sATUANKERJA2;
    data['KETERANGAN_SATUAN_KERJA_2'] = this.kETERANGANSATUANKERJA2;
    data['NO_SK_2'] = this.nOSK2;
    data['TGL_SK_2'] = this.tGLSK2;
    data['TMT_SK_2'] = this.tMTSK2;
    data['KETERANGAN'] = this.kETERANGAN;
    data['MK_TAHUN'] = this.mKTAHUN;
    data['MK_BULAN'] = this.mKBULAN;
    return data;
  }
}
