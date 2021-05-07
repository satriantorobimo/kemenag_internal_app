import 'package:flutter/material.dart';
import 'package:kemenag_go_internal_app/asn/feature/info_statker/presentation/widget/card_menu_widget.dart';

class InfoStatkerScreen extends StatefulWidget {
  @override
  _InfoStatkerScreenState createState() => _InfoStatkerScreenState();
}

class _InfoStatkerScreenState extends State<InfoStatkerScreen> {
  Widget appBarTitle = Text(
    'Info Statker',
    style: TextStyle(color: Colors.black, fontSize: 16),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              CardMenuWidget(
                image: Image.asset(
                  'assets/images/infostaker.png',
                  width: 22,
                ),
                onTap: () {},
                title: 'Bidang Hukum',
                subTitle: '50',
              ),
              SizedBox(height: 8),
              CardMenuWidget(
                image: Image.asset(
                  'assets/images/infostaker.png',
                  width: 22,
                ),
                onTap: () {},
                title: 'Bidang Hubungan Masyarakat',
                subTitle: '50',
              ),
            ],
          ),
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
