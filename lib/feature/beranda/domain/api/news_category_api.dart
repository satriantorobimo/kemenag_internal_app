import 'package:kemenag_go_internal_app/core/function/network_util.dart';
import 'package:kemenag_go_internal_app/core/resources/url_strings.dart';
import 'package:kemenag_go_internal_app/feature/beranda/data/model/news_category_model.dart';

class NewsCategoryApiClient {
  NewsCategoryModel newsCategoryModel;
  NetworkUtil netUtil = NetworkUtil();
  UrlString urlString = UrlString();

  Future<NewsCategoryModel> getNewsCategory() async {
    final Map<String, String> header = urlString.getHeaderType();
    return await netUtil
        .get(urlString.getUrlNewsCategory(), headers: header)
        .then((dynamic res) {
      print(res);
      newsCategoryModel = NewsCategoryModel.fromJson(res);
      return newsCategoryModel;
    }).catchError((dynamic onError) {
      return onError;
    });
  }
}
