import 'package:flutter/material.dart';
import 'package:kemenag_go_internal_app/asn/feature/beranda/data/service_asn_model.dart';
import 'package:kemenag_go_internal_app/asn/feature/beranda/presentation/widget/carousel_header_widget.dart';
import 'package:kemenag_go_internal_app/asn/feature/beranda/presentation/widget/header_beranda_widget.dart';
import 'package:kemenag_go_internal_app/asn/feature/beranda/presentation/widget/news_widget.dart';
import 'package:kemenag_go_internal_app/core/design_system/colors.dart';
import 'package:kemenag_go_internal_app/core/resources/routes.dart';

class BerandaAsnScreen extends StatefulWidget {
  @override
  _BerandaAsnScreenState createState() => _BerandaAsnScreenState();
}

class _BerandaAsnScreenState extends State<BerandaAsnScreen> {
  List<AsnService> _asnService = [];

  @override
  void initState() {
    _asnService.add(AsnService(
        tags: 'info-staker',
        image: Image.asset(
          'assets/images/infostaker.png',
          width: 22,
        ),
        title: 'Info Staker'));
    _asnService.add(AsnService(
        tags: 'forum',
        image: Image.asset(
          'assets/images/forum.png',
          width: 22,
        ),
        title: 'Forum'));
    _asnService.add(AsnService(
        tags: 'meeting',
        image: Image.asset(
          'assets/images/meeting.png',
          width: 22,
        ),
        title: 'Meeting'));
    _asnService.add(AsnService(
        tags: 'absensi',
        image: Image.asset(
          'assets/images/absensi.png',
          width: 22,
        ),
        title: 'Absensi'));
    _asnService.add(AsnService(
        tags: 'data-kepegawaian',
        image: Image.asset(
          'assets/images/user-white.png',
          width: 22,
        ),
        title: 'Data Kepegawain'));
    _asnService.add(AsnService(
        tags: 'edocument',
        image: Image.asset(
          'assets/images/edocument.png',
          width: 22,
        ),
        title: 'E-Document'));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height * .16,
            decoration: BoxDecoration(
              color: DSColor.primaryGreen,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(24.0),
                bottomRight: Radius.circular(24.0),
              ),
            ),
            child: HeaderBerandaAsnWidget(),
          ),
          Container(
            alignment: Alignment.topCenter,
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * .11,
                right: 12.0,
                left: 12.0),
            child: Container(
              height: 185.0,
              width: MediaQuery.of(context).size.width,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                color: Colors.white,
                elevation: 4.0,
                child: Center(child: _buildServicesMenu()),
              ),
            ),
          ),
          Container(
            alignment: Alignment.topCenter,
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * .37),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 16,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0, right: 16),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Color(0xFFD9D9D9).withOpacity(0.6),
                        borderRadius: BorderRadius.all(Radius.circular(24)),
                        border: Border.all(
                          width: 1,
                          color: Colors.black26,
                        ),
                      ),
                      height: 36,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Row(
                          children: [
                            Icon(
                              Icons.camera_alt_outlined,
                              size: 16,
                              color: Colors.black45,
                            ),
                            SizedBox(width: 8),
                            Text(
                              'Verifikasi Data HUMIN',
                              style: TextStyle(
                                color: Colors.black45,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 4.0),
                    child: CarouselHeaderAsnWidget(),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  NewsAsnWidget(),
                  SizedBox(
                    height: 16,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildServicesMenu() {
    return SizedBox(
        width: double.infinity,
        height: 200.0,
        child: Container(
            child: GridView.builder(
                physics: ClampingScrollPhysics(),
                itemCount: 6,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 3 / 1.7,
                  crossAxisCount: 3,
                  mainAxisSpacing: 14,
                  crossAxisSpacing: 16,
                ),
                itemBuilder: (context, position) {
                  return _rowService(_asnService[position]);
                })));
  }

  Widget _rowService(AsnService asnService) {
    return Container(
      child: InkWell(
        onTap: () {
          if (asnService.tags == 'meeting') {
            Navigator.pushNamed(context, meetingRoute);
          } else if (asnService.tags == 'data-kepegawaian') {
            Navigator.pushNamed(context, dataKepegawaianRoute);
          } else if (asnService.tags == 'forum') {
            Navigator.pushNamed(context, forumRoute);
          } else if (asnService.tags == 'info-staker') {
            Navigator.pushNamed(context, infoStatkerRoute);
          } else if (asnService.tags == 'absensi') {
            Navigator.pushNamed(context, absensiRoute);
          } else if (asnService.tags == 'edocument') {
            Navigator.pushNamed(context, edocumentRoute);
          }
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  color: DSColor.primaryGreen,
                  border: Border.all(color: DSColor.primaryGreen, width: 1.0),
                  borderRadius: BorderRadius.all(Radius.circular(100.0))),
              padding: EdgeInsets.all(8.0),
              child: asnService.image,
            ),
            Padding(
              padding: EdgeInsets.only(top: 6.0),
            ),
            Text(asnService.title, style: TextStyle(fontSize: 10.0))
          ],
        ),
      ),
    );
  }
}
