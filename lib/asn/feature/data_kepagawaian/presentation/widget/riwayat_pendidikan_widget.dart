import 'package:flutter/material.dart';
import 'package:kemenag_go_internal_app/asn/feature/profile/presentation/widget/label_and_value_widget.dart';
import 'package:kemenag_go_internal_app/core/design_system/colors.dart';
import 'package:kemenag_go_internal_app/asn/feature/data_kepagawaian/data/data_kepegawaian_model.dart';

class RiwayatPendidikanWidget extends StatefulWidget {
  final Datas datas;
  RiwayatPendidikanWidget(this.datas);

  @override
  _RiwayatPendidikanWidgetState createState() =>
      _RiwayatPendidikanWidgetState();
}

class _RiwayatPendidikanWidgetState extends State<RiwayatPendidikanWidget> {
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
            value.nAMASEKOLAH ?? '-',
            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
          ),
          subtitle: Text(value.fAKULTASPENDIDIKAN ?? '-',
              style: TextStyle(fontSize: 12, color: Colors.black)),
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  LabelValueWidget(
                      'Tahun Lulus', value.tAHUNLULUS.toString() ?? '-'),
                  LabelValueWidget(
                      'Pendidikan', value.jENJANGPENDIDIKAN ?? '-'),
                ],
              ),
            ),
            SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  LabelValueWidget('Jurusan', value.jURUSAN ?? '-'),
                  LabelValueWidget('Keterangan', '-'),
                ],
              ),
            ),
            SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  LabelValueWidget(
                      'Lokasi Sekolah', value.lOKASISEKOLAH ?? '-'),
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
