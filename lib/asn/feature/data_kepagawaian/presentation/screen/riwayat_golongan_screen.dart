import 'package:flutter/material.dart';
import 'package:kemenag_go_internal_app/asn/feature/data_kepagawaian/presentation/widget/riwayat_gologan_widget.dart';
import 'package:kemenag_go_internal_app/asn/feature/data_kepagawaian/data/data_kepegawaian_model.dart';

class RiwayatGolonganScreen extends StatefulWidget {
  final Datas datas;
  RiwayatGolonganScreen(this.datas);
  @override
  _RiwayatGolonganScreenState createState() => _RiwayatGolonganScreenState();
}

class _RiwayatGolonganScreenState extends State<RiwayatGolonganScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(context),
      body: RiwayatGolonganWidget(widget.datas),
    );
  }

  Widget buildAppBar(BuildContext context) {
    return AppBar(
      centerTitle: false,
      elevation: 0,
      titleSpacing: 0,
      title: Text(
        'Riwayat Golongan / KP',
        style: TextStyle(color: Colors.black, fontSize: 16),
      ),
      backgroundColor: Colors.white,
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
    );
  }
}
