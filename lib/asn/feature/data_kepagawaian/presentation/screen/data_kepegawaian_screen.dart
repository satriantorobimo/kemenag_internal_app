import 'package:flutter/material.dart';
import 'package:kemenag_go_internal_app/asn/feature/meeting/presentation/widget/card_menu_widget.dart';

class DataKepegawaianScreen extends StatefulWidget {
  DataKepegawaianScreen({Key key}) : super(key: key);

  @override
  _DataKepegawaianScreenState createState() => _DataKepegawaianScreenState();
}

class _DataKepegawaianScreenState extends State<DataKepegawaianScreen> {
  Widget appBarTitle = Text(
    'Data Kepegawaian',
    style: TextStyle(color: Colors.black, fontSize: 16),
  );
  Icon icon = Icon(
    Icons.search,
    color: Colors.black,
    size: 18,
  );
  final globalKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      key: globalKey,
      appBar: buildAppBar(context),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CardMenuWidget(
              image: Image.asset(
                'assets/images/user-white.png',
                width: 22,
              ),
              onTap: () {},
              title: 'Data Utama',
            ),
            SizedBox(height: 8),
            CardMenuWidget(
              image: Image.asset(
                'assets/images/user-white.png',
                width: 22,
              ),
              onTap: () {},
              title: 'Golongan / KP',
            ),
            SizedBox(height: 8),
            CardMenuWidget(
              image: Image.asset(
                'assets/images/user-white.png',
                width: 22,
              ),
              onTap: () {},
              title: 'Jabatan',
            ),
            SizedBox(height: 8),
            CardMenuWidget(
              image: Image.asset(
                'assets/images/user-white.png',
                width: 22,
              ),
              onTap: () {},
              title: 'Pendidikan',
            ),
            SizedBox(height: 8),
            CardMenuWidget(
              image: Image.asset(
                'assets/images/user-white.png',
                width: 22,
              ),
              onTap: () {},
              title: 'SKP',
            ),
            SizedBox(height: 8),
          ],
        ),
      ),
    );
  }

  Widget buildAppBar(BuildContext context) {
    return AppBar(
      centerTitle: false,
      elevation: 0,
      titleSpacing: 0,
      title: appBarTitle,
      backgroundColor: Colors.white,
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
    );
  }
}
