import 'package:flutter/material.dart';
import 'package:kemenag_go_internal_app/core/design_system/colors.dart';
import 'package:kemenag_go_internal_app/non_asn/feature/beranda/presentation/widget/carousel_header_widget.dart';
import 'package:kemenag_go_internal_app/non_asn/feature/beranda/presentation/widget/header_beranda_widget.dart';
import 'package:kemenag_go_internal_app/non_asn/feature/beranda/presentation/widget/news_widget.dart';

class BerandaNonAsnScreen extends StatefulWidget {
  @override
  _BerandaNonAsnScreenState createState() => _BerandaNonAsnScreenState();
}

class _BerandaNonAsnScreenState extends State<BerandaNonAsnScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DSColor.primaryGreen,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
              padding: EdgeInsets.only(
                  top: 32.0, left: 16.0, right: 16.0, bottom: 16.0),
              child: HeaderBerandaNonAsnWidget()),
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

                        CarouselHeaderNonAsnWidget(),
                        SizedBox(
                          height: 8,
                        ),
                        NewsNonAsnWidget(),
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
