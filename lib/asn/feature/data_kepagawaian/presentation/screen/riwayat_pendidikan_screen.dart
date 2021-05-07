import 'package:flutter/material.dart';
import 'package:kemenag_go_internal_app/asn/feature/data_kepagawaian/presentation/widget/riwayat_pendidikan_widget.dart';
import 'package:kemenag_go_internal_app/asn/feature/data_kepagawaian/data/data_kepegawaian_model.dart';

class RiwayatPendidikanScreen extends StatefulWidget {
  final Datas datas;
  RiwayatPendidikanScreen(this.datas);

  @override
  _RiwayatPendidikanScreenState createState() =>
      _RiwayatPendidikanScreenState();
}

class _RiwayatPendidikanScreenState extends State<RiwayatPendidikanScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(context),
      body: RiwayatPendidikanWidget(widget.datas),
    );
  }

  Widget buildAppBar(BuildContext context) {
    return AppBar(
      centerTitle: false,
      elevation: 0,
      titleSpacing: 0,
      title: Text(
        'Riwayat Pendidikan',
        style: TextStyle(color: Colors.black, fontSize: 16),
      ),
      backgroundColor: Colors.white,
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
    );
  }
}
