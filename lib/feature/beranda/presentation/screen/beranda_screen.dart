import 'package:flutter/material.dart';
import 'package:kemenag_go_internal_app/core/design_system/colors.dart';
import 'package:kemenag_go_internal_app/feature/beranda/presentation/widget/carousel_header_widget.dart';
import 'package:kemenag_go_internal_app/feature/beranda/presentation/widget/floating_button_widget.dart';
import 'package:kemenag_go_internal_app/feature/beranda/presentation/widget/header_beranda_widget.dart';
import 'package:kemenag_go_internal_app/feature/beranda/presentation/widget/news_widget.dart';

class BerandaScreen extends StatefulWidget {
  @override
  _BerandaScreenState createState() => _BerandaScreenState();
}

class _BerandaScreenState extends State<BerandaScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DSColor.primaryGreen,
      floatingActionButton: FloatingButtonWidget(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
              padding: EdgeInsets.only(
                  top: 32.0, left: 16.0, right: 16.0, bottom: 16.0),
              child: HeaderBerandaWidget()),
          Expanded(
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 0.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16.0),
                    topRight: Radius.circular(16.0),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 24.0),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        // Padding(
                        //   padding: const EdgeInsets.only(left: 16.0),
                        //   child: ClipRRect(
                        //     borderRadius: const BorderRadius.only(
                        //       bottomRight: Radius.circular(13.0),
                        //       bottomLeft: Radius.circular(13.0),
                        //       topRight: Radius.circular(13.0),
                        //       topLeft: Radius.circular(13.0),
                        //     ),
                        //     child: Column(
                        //       children: <Widget>[
                        //         CarouselSlider(
                        //           items: images
                        //               .map((item) => Image.network(
                        //                     item,
                        //                     fit: BoxFit.cover,
                        //                     width: double.infinity,
                        //                   ))
                        //               .toList(),
                        //           options: CarouselOptions(

                        //             viewportFraction: 1.0,
                        //             enableInfiniteScroll: false,
                        //             autoPlay: true,
                        //             aspectRatio: 36.0 / 17.0,
                        //             onPageChanged: (int index,
                        //                 CarouselPageChangedReason reason) {},
                        //           ),
                        //         ),
                        //       ],
                        //     ),
                        //   ),
                        // ),
                        //

                        CarouselHeaderWidget(),
                        SizedBox(
                          height: 8,
                        ),
                        NewsWidget(),
                        SizedBox(
                          height: 120,
                        ),
                      ],
                    ),
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
