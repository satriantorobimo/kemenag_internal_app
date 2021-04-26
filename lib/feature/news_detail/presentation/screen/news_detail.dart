import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:indonesia/indonesia.dart';
import 'package:intl/intl.dart';
import 'package:kemenag_go_internal_app/core/design_system/colors.dart';
import 'package:kemenag_go_internal_app/feature/beranda/data/model/news_model.dart';

class NewsDetailScreen extends StatefulWidget {
  const NewsDetailScreen({Key key, this.datas}) : super(key: key);
  final Datas datas;

  @override
  _NewsDetailScreenState createState() => _NewsDetailScreenState();
}

class _NewsDetailScreenState extends State<NewsDetailScreen> {
  final ScrollController _scrollController = ScrollController();
  var top = 0.0;

  @override
  Widget build(BuildContext context) {
    final String date = widget.datas.created_at;
    final DateTime tempDate = DateFormat('yyyy-MM-dd').parse(date);
    final String formattedDate = tanggal(tempDate);
    return Scaffold(
        backgroundColor: Colors.white,
        body: NestedScrollView(
            controller: _scrollController,
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverOverlapAbsorber(
                    handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                        context),
                    sliver: SliverAppBar(
                        expandedHeight: 350.0,
                        floating: true,
                        pinned: true,
                        elevation: 0,
                        actionsIconTheme: IconThemeData(opacity: 0.0),
                        forceElevated: innerBoxIsScrolled,
                        snap: true,
                        backgroundColor: Colors.white,
                        flexibleSpace: LayoutBuilder(builder:
                            (BuildContext context, BoxConstraints constraints) {
                          top = constraints.biggest.height;
                          return FlexibleSpaceBar(
                            background: CachedNetworkImage(
                              fit: BoxFit.cover,
                              imageUrl: widget.datas.url_photo,
                              progressIndicatorBuilder:
                                  (context, url, downloadProgress) => Center(
                                child: CircularProgressIndicator(
                                    value: downloadProgress.progress),
                              ),
                            ),
                          );
                        }),
                        automaticallyImplyLeading: false,
                        leading: InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(
                            Icons.arrow_back,
                            color: DSColor.primaryGreen,
                          ),
                        ))),
              ];
            },
            body: Container(
              margin: EdgeInsets.only(top: 80),
              child: NotificationListener<OverscrollIndicatorNotification>(
                onNotification: (overscroll) {
                  overscroll.disallowGlow();
                },
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        widget.datas.news_category.name,
                        style: TextStyle(
                          color: DSColor.primaryGreen,
                          fontSize: 10.0,
                        ),
                      ),
                    ),
                    SizedBox(height: 8),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: Text(
                          widget.datas.title,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 8),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        '$formattedDate',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 7.0,
                        ),
                      ),
                    ),
                    SizedBox(height: 8),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: Theme(
                        data: ThemeData(primaryColor: Colors.black),
                        child: Html(
                            data: '''
                                        ${widget.datas.content}
                                        ''',
                            onLinkTap: (String url) async {
                              // if (await canLaunch(url)) {
                              //   await launch(url);
                              // } else {
                              //   throw 'Could not launch $url';
                              // }
                            }),
                      ),
                    ),
                  ],
                ),
              ),
            )));
  }
}
