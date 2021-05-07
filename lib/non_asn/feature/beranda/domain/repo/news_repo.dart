import 'dart:async';

import 'package:kemenag_go_internal_app/non_asn/feature/beranda/data/model/news_model.dart';
import 'package:kemenag_go_internal_app/non_asn/feature/beranda/domain/api/news_api.dart';

class NewsRepository {
  NewsApiClient newsApiClient = NewsApiClient();

  Future<NewsModel> getNews() => newsApiClient.getNews();
}
