import 'package:flutter/material.dart';
import 'package:kemenag_go_internal_app/asn/feature/meeting/presentation/widget/jadwal_meeting_widget.dart';
import 'package:kemenag_go_internal_app/asn/feature/meeting/presentation/widget/meeting_widget.dart';
import 'package:kemenag_go_internal_app/asn/feature/meeting/presentation/widget/riwayat_widget.dart';
import 'package:kemenag_go_internal_app/core/design_system/colors.dart';

class MeetingScreen extends StatefulWidget {
  @override
  _MeetingScreenState createState() => _MeetingScreenState();
}

class _MeetingScreenState extends State<MeetingScreen> {
  Widget appBarTitle = Text(
    'Meeting',
    style: TextStyle(color: Colors.black, fontSize: 16),
  );
  final globalKey = GlobalKey<ScaffoldState>();
  TabController _tabController;

  List _tabs = ['Meeting', 'Jadwal Meeting', 'Riwayat'];

  List _widget = [MeetingWidget(), JadwalMeetingWidget(), RiwayatWidget()];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _tabs.length,
      child: Scaffold(
          backgroundColor: Color(0xFFF5F5F5),
          key: globalKey,
          appBar: buildAppBar(context),
          body: TabBarView(
              controller: _tabController,
              physics: const NeverScrollableScrollPhysics(),
              children: List<Widget>.generate(_widget.length, (int index) {
                return _widget[index];
              }))),
    );
  }

  Widget buildAppBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(40),

        ///Note: Here I assigned 40 according to me. You can adjust this size acoording to your purpose.
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Align(
              alignment: Alignment.centerLeft,
              child: Container(
                child: TabBar(
                  controller: _tabController,
                  indicator: UnderlineTabIndicator(
                      borderSide: BorderSide(
                        width: 2,
                        color: DSColor.primaryGreen,
                      ),
                      insets: EdgeInsets.only(left: 0, right: 8, bottom: 4)),
                  isScrollable: true,
                  labelPadding: const EdgeInsets.only(left: 0, right: 24),
                  labelColor: DSColor.primaryGreen,
                  unselectedLabelColor: Colors.black.withOpacity(0.5),
                  tabs: List<Widget>.generate(_tabs.length, (int index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: Tab(text: _tabs[index]),
                    );
                  }),
                ),
              )),
        ),
      ),
      centerTitle: false,
      titleSpacing: 0,
      title: appBarTitle,
      backgroundColor: Colors.white,
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
    );
  }
}
