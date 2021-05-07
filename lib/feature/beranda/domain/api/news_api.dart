import 'package:kemenag_go_internal_app/core/function/network_util.dart';
import 'package:kemenag_go_internal_app/core/resources/url_strings.dart';
import 'package:kemenag_go_internal_app/feature/beranda/data/model/news_model.dart';

class NewsApiClient {
  NewsModel newsModel;
  NetworkUtil netUtil = NetworkUtil();
  UrlString urlString = UrlString();

  Future<NewsModel> getNews() async {
    final Map<String, String> header = urlString.getHeaderType();
    return await netUtil
        .get(urlString.getUrlNews(), headers: header)
        .then((dynamic res) {
      print(res);
      newsModel = NewsModel.fromJson(res);
      return newsModel;
    });
  }
}
