import 'package:flutter/material.dart';
import 'package:kemenag_go_internal_app/asn/feature/profile/presentation/widget/avatar_widget.dart';
import 'package:kemenag_go_internal_app/asn/feature/profile/presentation/widget/menu_widget.dart';
import 'package:kemenag_go_internal_app/asn/feature/profile/presentation/widget/profile_detail_widget.dart';
import 'package:kemenag_go_internal_app/core/design_system/colors.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({Key key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Widget appBarTitle = Text(
    'Profil',
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AvatarWidget(),
              SizedBox(height: 16),
              ProfileDetailWidget(),
              MenuWidget()
            ],
          ),
        ),
      ),
    );
  }

  Widget buildAppBar(BuildContext context) {
    return AppBar(
      centerTitle: false,
      elevation: 1,
      titleSpacing: 0,
      title: appBarTitle,
      backgroundColor: Colors.white,
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: Row(
            children: [
              Icon(Icons.edit_rounded, size: 14, color: DSColor.primaryGreen),
              SizedBox(width: 8),
              Text('Edit Profil',
                  style: TextStyle(fontSize: 11, color: DSColor.primaryGreen))
            ],
          ),
        )
      ],
    );
  }
}
