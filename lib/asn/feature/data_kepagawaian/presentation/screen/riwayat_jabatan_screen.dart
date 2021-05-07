import 'package:flutter/material.dart';
import 'package:kemenag_go_internal_app/asn/feature/data_kepagawaian/presentation/widget/riwayat_jabatan_widget.dart';
import 'package:kemenag_go_internal_app/asn/feature/data_kepagawaian/data/data_kepegawaian_model.dart';

class RiwayatJabatanScreen extends StatefulWidget {
  final Datas datas;
  RiwayatJabatanScreen(this.datas);

  @override
  _RiwayatJabatanScreenState createState() => _RiwayatJabatanScreenState();
}

class _RiwayatJabatanScreenState extends State<RiwayatJabatanScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(context),
      body: RiwayatJabatanWidget(widget.datas),
    );
  }

  Widget buildAppBar(BuildContext context) {
    return AppBar(
      centerTitle: false,
      elevation: 0,
      titleSpacing: 0,
      title: Text(
        'Riwayat Jabatan',
        style: TextStyle(color: Colors.black, fontSize: 16),
      ),
      backgroundColor: Colors.white,
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
    );
  }
}
