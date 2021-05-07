import 'package:flutter/material.dart';
import 'package:indonesia/indonesia.dart';
import 'package:intl/intl.dart';
import 'package:kemenag_go_internal_app/asn/feature/profile/presentation/widget/label_and_value_widget.dart';
import 'package:kemenag_go_internal_app/core/design_system/colors.dart';
import 'package:kemenag_go_internal_app/asn/feature/data_kepagawaian/data/data_kepegawaian_model.dart';

class RiwayatGolonganWidget extends StatefulWidget {
  final Datas datas;
  RiwayatGolonganWidget(this.datas);

  @override
  _RiwayatGolonganWidgetState createState() => _RiwayatGolonganWidgetState();
}

class _RiwayatGolonganWidgetState extends State<RiwayatGolonganWidget> {
  DateTime tempDateTglSk;
  DateTime tempDateTmtSk;
  String dateTglSk = '';
  String dateTmtSk = '';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: _mainContent(),
    );
  }

  Widget _mainContent() {
    return ListView.separated(
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(height: 16);
        },
        itemCount: widget.datas.value.length,
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return _buildItemList(widget.datas.value[index], context);
        });
  }

  Widget _buildItemList(Value value, BuildContext context) {
    if (value.tGLSK != null) {
      tempDateTglSk = DateFormat("yyyy-MM-dd").parse(value.tGLSK);
      dateTglSk = tanggal(tempDateTglSk);
    }
    if (value.tMTSK != null) {
      tempDateTmtSk = DateFormat("yyyy-MM-dd").parse(value.tMTSK);
      dateTmtSk = tanggal(tempDateTmtSk);
    }

    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Theme(
        data: Theme.of(context).copyWith(
            accentColor: DSColor.primaryGreen,
            dividerColor: Colors.transparent),
        child: ExpansionTile(
          title: Text(
            value.pANGKAT ?? '-',
            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
          ),
          subtitle: Text(value.gOLRUANG ?? '-',
              style: TextStyle(fontSize: 12, color: Colors.black)),
          children: <Widget>[
            SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  LabelValueWidget('No SK', value.nOSK ?? '-'),
                  LabelValueWidget('Tanggal SK', dateTglSk),
                ],
              ),
            ),
            SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  LabelValueWidget('TMT-SK', dateTmtSk),
                  LabelValueWidget('Tahun - Bulan',
                      '${value.mKTAHUN.toString()} - ${value.mKBULAN.toString()}'),
                ],
              ),
            ),
            SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  LabelValueWidget('Keterangan', value.kETERANGAN ?? '-'),
                  LabelValueWidget('', ''),
                ],
              ),
            ),
            SizedBox(height: 16)
          ],
        ),
      ),
    );
  }
}
