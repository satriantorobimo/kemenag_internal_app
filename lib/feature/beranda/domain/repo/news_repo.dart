import 'dart:async';

import 'package:kemenag_go_internal_app/feature/beranda/data/model/news_model.dart';
import 'package:kemenag_go_internal_app/feature/beranda/domain/api/news_api.dart';

class NewsRepository {
  NewsApiClient newsApiClient = NewsApiClient();

  Future<NewsModel> getNews() => newsApiClient.getNews();
}
