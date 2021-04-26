import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:kemenag_go_internal_app/core/design_system/colors.dart';
import 'package:kemenag_go_internal_app/core/resources/routes.dart';
import 'package:kemenag_go_internal_app/feature/beranda/data/model/news_model.dart';
import 'package:kemenag_go_internal_app/feature/beranda/domain/repo/news_category_repo.dart';
import 'package:kemenag_go_internal_app/feature/beranda/domain/repo/news_repo.dart';
import 'package:kemenag_go_internal_app/feature/beranda/presentation/bloc/news_bloc/bloc.dart';
import 'package:kemenag_go_internal_app/feature/beranda/presentation/bloc/news_category_bloc/bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:indonesia/indonesia.dart';

class NewsWidget extends StatefulWidget {
  @override
  _NewsWidgetState createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {
  List<String> _listNewsCategory = ["Semua"];
  int _selectedIndex = 0;
  NewsBloc newsBloc = NewsBloc(newsRepository: NewsRepository());
  NewsCategoryBloc newsCategoryBloc =
      NewsCategoryBloc(newsCategoryRepository: NewsCategoryRepository());

  @override
  void initState() {
    super.initState();
    newsBloc.add(GetNews());
    newsCategoryBloc.add(GetNewsCategory());
  }

  @override
  void dispose() {
    super.dispose();
    newsBloc.close();
    newsCategoryBloc.close();
  }

  _onSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Berita Terbaru',
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                      fontWeight: FontWeight.bold)),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, newsRoute);
                },
                child: Text('Lihat Semua',
                    style:
                        TextStyle(fontSize: 12, color: DSColor.primaryGreen)),
              )
            ],
          ),
        ),
        BlocListener<NewsCategoryBloc, NewsCategoryState>(
            cubit: newsCategoryBloc,
            listener: (_, NewsCategoryState state) {
              if (state is NewsCategoryLoaded) {
                final List<String> _listNewsCategoryTemp = [];
                final List<int> _listNewsCategoryTempId = [];
                for (int i = 0; i < state.newsCategoryModel.data.total; i++) {
                  if (state.newsCategoryModel.data.data.isNotEmpty) {
                    _listNewsCategoryTemp
                        .add(state.newsCategoryModel.data.data[i].name);
                  }

                  if (i == state.newsCategoryModel.data.total - 1) {
                    _listNewsCategory = _listNewsCategoryTemp.toSet().toList();
                    _listNewsCategory.insert(0, 'Semua');
                  }
                }
              }
            },
            child: BlocBuilder<NewsCategoryBloc, NewsCategoryState>(
                cubit: newsCategoryBloc,
                builder: (_, NewsCategoryState state) {
                  if (state is NewsCategoryInitial) {
                    return _newsCategory();
                  }
                  if (state is NewsCategoryLoading) {
                    return _newsCategory();
                  }
                  if (state is NewsCategoryLoaded) {
                    return _newsCategory();
                  }
                  if (state is NewsCategoryError) {
                    return _newsCategory();
                  }
                  return _newsCategory();
                })),
        BlocListener<NewsBloc, NewsState>(
            cubit: newsBloc,
            listener: (_, NewsState state) {},
            child: BlocBuilder<NewsBloc, NewsState>(
                cubit: newsBloc,
                builder: (_, NewsState state) {
                  if (state is NewsInitial) {
                    return _skeletonLoadingNews();
                  }
                  if (state is NewsLoading) {
                    return _skeletonLoadingNews();
                  }
                  if (state is NewsLoaded) {
                    return _newsContent(state.newsModel);
                  }
                  if (state is NewsError) {
                    return Container();
                  }
                  return Container();
                })),
      ],
    );
  }

  Widget _newsCategory() {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, top: 8.0),
      child: SizedBox(
        height: 25.0,
        child: ListView.separated(
            separatorBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.only(right: 8.0),
              );
            },
            itemCount: _listNewsCategory.length,
            scrollDirection: Axis.horizontal,
            physics: ScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) => InkWell(
                  onTap: () {
                    _onSelected(index);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                          color:
                              _selectedIndex != null && _selectedIndex == index
                                  ? DSColor.primaryGreen
                                  : Colors.grey),
                      color: _selectedIndex != null && _selectedIndex == index
                          ? DSColor.primaryGreen
                          : Colors.white,
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Text(_listNewsCategory[index],
                            style: TextStyle(
                                fontSize: 8,
                                color: _selectedIndex != null &&
                                        _selectedIndex == index
                                    ? Colors.white
                                    : Colors.grey)),
                      ),
                    ),
                  ),
                )),
      ),
    );
  }

  Widget _newsContent(NewsModel newsModel) {
    var size = MediaQuery.of(context).size;

    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width / 2;
    if (_selectedIndex == 0) {
      return Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0),
        child: GridView.count(
          childAspectRatio: ((itemWidth / itemHeight) * 1.55),
          shrinkWrap: true,
          crossAxisCount: 2,
          scrollDirection: Axis.vertical,
          physics: ScrollPhysics(),
          children: List.generate(newsModel.data.data.length, (index) {
            final String date = newsModel.data.data[index].created_at;
            final DateTime tempDate = DateFormat('yyyy-MM-dd').parse(date);
            final String formattedDate = tanggal(tempDate);
            return InkWell(
              onTap: () {
                Navigator.pushNamed(context, detailNewsRoute,
                    arguments: newsModel.data.data[index]);
              },
              child: SizedBox(
                width: 200.0,
                child: Card(
                  semanticContainer: true,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  elevation: 0.0,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                        color: Colors.grey.withOpacity(0.2), width: 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CachedNetworkImage(
                        imageUrl: newsModel.data.data[index].url_photo,
                        progressIndicatorBuilder:
                            (context, url, downloadProgress) => Center(
                          child: CircularProgressIndicator(
                              value: downloadProgress.progress),
                        ),
                      ),
                      SizedBox(height: 8),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                        child: Text(
                          newsModel.data.data[index].title,
                          style: TextStyle(
                              fontSize: 10, fontWeight: FontWeight.w500),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      SizedBox(height: 8),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(newsModel.data.data[index].news_category.name,
                                style: TextStyle(
                                    fontSize: 7, color: DSColor.primaryGreen)),
                            Text(formattedDate,
                                style:
                                    TextStyle(fontSize: 7, color: Colors.grey)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
        ),
      );
    } else {
      final List<Datas> datas = newsModel.data.data
          .where((dynamic element) => element.news_category.name
              .contains(_listNewsCategory[_selectedIndex]))
          .toList();
      return Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0),
        child: GridView.count(
          childAspectRatio: ((itemWidth / itemHeight) * 1.55),
          shrinkWrap: true,
          crossAxisCount: 2,
          scrollDirection: Axis.vertical,
          physics: ScrollPhysics(),
          children: List.generate(datas.length, (index) {
            final String date = datas[index].created_at;
            final DateTime tempDate = DateFormat('yyyy-MM-dd').parse(date);
            final String formattedDate = tanggal(tempDate);
            return InkWell(
              onTap: () {
                Navigator.pushNamed(context, detailNewsRoute,
                    arguments: datas[index]);
              },
              child: SizedBox(
                width: 200.0,
                child: Card(
                  semanticContainer: true,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  elevation: 0.0,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                        color: Colors.grey.withOpacity(0.2), width: 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CachedNetworkImage(
                        imageUrl: datas[index].url_photo,
                        progressIndicatorBuilder:
                            (context, url, downloadProgress) => Center(
                          child: CircularProgressIndicator(
                              value: downloadProgress.progress),
                        ),
                      ),
                      SizedBox(height: 8),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                        child: Text(
                          datas[index].title,
                          style: TextStyle(
                              fontSize: 10, fontWeight: FontWeight.w500),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      SizedBox(height: 8),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(datas[index].news_category.name,
                                style: TextStyle(
                                    fontSize: 7, color: DSColor.primaryGreen)),
                            Text(formattedDate,
                                style:
                                    TextStyle(fontSize: 7, color: Colors.grey)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
        ),
      );
    }
  }

  Widget _skeletonLoadingNews() {
    var size = MediaQuery.of(context).size;

    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width / 2;
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0),
      child: GridView.count(
          childAspectRatio: ((itemWidth / itemHeight) * 1.55),
          shrinkWrap: true,
          crossAxisCount: 2,
          scrollDirection: Axis.vertical,
          physics: ScrollPhysics(),
          children: List.generate(50, (index) {
            return Shimmer.fromColors(
                baseColor: Colors.grey.withOpacity(0.4),
                highlightColor: Colors.white,
                child: SizedBox(
                  width: 200.0,
                  child: Card(),
                ));
          })),
    );
  }
}
