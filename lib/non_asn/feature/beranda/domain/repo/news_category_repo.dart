import 'dart:async';

import 'package:kemenag_go_internal_app/non_asn/feature/beranda/data/model/news_category_model.dart';
import 'package:kemenag_go_internal_app/non_asn/feature/beranda/domain/api/news_category_api.dart';

class NewsCategoryRepository {
  NewsCategoryApiClient newsCategoryApiClient = NewsCategoryApiClient();

  Future<NewsCategoryModel> getNewsCategory() =>
      newsCategoryApiClient.getNewsCategory();
}
