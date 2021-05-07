import 'package:flutter/material.dart';
import 'package:indonesia/indonesia.dart';
import 'package:intl/intl.dart';
import 'package:kemenag_go_internal_app/asn/feature/profile/presentation/widget/label_and_value_widget.dart';
import 'package:kemenag_go_internal_app/asn/feature/data_kepagawaian/data/data_kepegawaian_model.dart';
import 'avatar_widget.dart';

class DataUtamaWidget extends StatefulWidget {
  final Datas datas;
  DataUtamaWidget(this.datas);
  @override
  _DataUtamaWidgetState createState() => _DataUtamaWidgetState();
}

class _DataUtamaWidgetState extends State<DataUtamaWidget> {
  DateTime tempDate;
  DateTime tempDateTmtPangkat;
  DateTime tempDateTmtJabatan;
  DateTime tempDateTmtPensiun;
  String dateTmtPensiun = '';
  String dateTmtJabatan = '';
  String dateTmtPangkat = '';
  String date = '';
  String jenisKelamin = '';
  String satker1 = '';
  String satker2 = '';
  String satker3 = '';
  String satker4 = '';
  String satker5 = '';

  @override
  void initState() {
    setState(() {
      tempDate =
          DateFormat("yyyy-MM-dd").parse(widget.datas.value[0].tANGGALLAHIR);
      date = tanggal(tempDate);
      tempDateTmtPangkat =
          DateFormat("yyyy-MM-dd").parse(widget.datas.value[0].tMTPANGKAT);
      dateTmtPangkat = tanggal(tempDateTmtPangkat);
      tempDateTmtJabatan =
          DateFormat("yyyy-MM-dd").parse(widget.datas.value[0].tMTJABATAN);
      dateTmtJabatan = tanggal(tempDateTmtJabatan);
      tempDateTmtPensiun =
          DateFormat("yyyy-MM-dd").parse(widget.datas.value[0].tMTPENSIUN);
      dateTmtPensiun = tanggal(tempDateTmtPensiun);

      if (widget.datas.value[0].jENISKELAMIN == 1) {
        jenisKelamin = 'Laki - Laki';
      } else {
        jenisKelamin = 'Perempuan';
      }
      if (widget.datas.value[0].sATKER1 != null) {
        satker1 = widget.datas.value[0].sATKER1;
      }
      if (widget.datas.value[0].sATKER2 != null) {
        satker2 = widget.datas.value[0].sATKER2;
      }
      if (widget.datas.value[0].sATKER3 != null) {
        satker3 = widget.datas.value[0].sATKER3;
      }
      if (widget.datas.value[0].sATKER4 != null) {
        satker4 = widget.datas.value[0].sATKER4;
      }
      if (widget.datas.value[0].sATKER5 != null) {
        satker5 = widget.datas.value[0].sATKER5;
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            SizedBox(height: 8),
            AvatarDataUtamaWidget(null),
            SizedBox(height: 16),
            Text(widget.datas.value[0].nAMALENGKAP,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            SizedBox(height: 4),
            Text(widget.datas.value[0].nIP,
                style: TextStyle(fontSize: 16, color: Colors.grey)),
            SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                LabelValueWidget('Agama', widget.datas.value[0].aGAMA),
                LabelValueWidget(
                    'Status Kawin', widget.datas.value[0].sTATUSKAWIN),
              ],
            ),
            SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                LabelValueWidget('Tempat & Tanggal Lahir',
                    '${widget.datas.value[0].tEMPATLAHIR}, $date'),
                LabelValueWidget('Jenis Kelamin', jenisKelamin),
              ],
            ),
            SizedBox(height: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Alamat',
                    style: TextStyle(fontSize: 9, color: Colors.grey)),
                SizedBox(height: 4),
                Text(
                    '${widget.datas.value[0].aLAMAT1} ${widget.datas.value[0].aLAMAT2}',
                    style: TextStyle(fontSize: 12, color: Colors.black)),
              ],
            ),
            SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                LabelValueWidget(
                    'Kabupaten / Kota', widget.datas.value[0].kABKOTA),
                LabelValueWidget('Provinsi', widget.datas.value[0].pROVINSI),
              ],
            ),
            SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                LabelValueWidget(
                    'Pendidikan', widget.datas.value[0].pENDIDIKAN),
                LabelValueWidget(
                    'Level Jabatan', widget.datas.value[0].lEVELJABATAN),
              ],
            ),
            SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                LabelValueWidget(
                    'Pangkat / Golongan', widget.datas.value[0].pANGKAT),
                LabelValueWidget('TMT-Pangkat', dateTmtPangkat),
              ],
            ),
            SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                LabelValueWidget('Masa Kerja',
                    '${widget.datas.value[0].mASAKERJATAHUN.toString()} Tahun, ${widget.datas.value[0].mASAKERJABULAN.toString()} Bulan'),
                LabelValueWidget(
                    'Tipe Jabatan', widget.datas.value[0].tIPEJABATAN),
              ],
            ),
            SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                LabelValueWidget(
                    'Jabatan', widget.datas.value[0].tAMPILJABATAN),
                LabelValueWidget('TMT-Jabatan', dateTmtJabatan),
              ],
            ),
            SizedBox(height: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Satuan Kerja',
                    style: TextStyle(fontSize: 9, color: Colors.grey)),
                SizedBox(height: 4),
                Text('$satker1 , $satker2, $satker3, $satker4, $satker5',
                    style: TextStyle(fontSize: 12, color: Colors.black)),
              ],
            ),
            SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                LabelValueWidget('TMT-Pensiun', dateTmtPensiun),
                LabelValueWidget('', ''),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
