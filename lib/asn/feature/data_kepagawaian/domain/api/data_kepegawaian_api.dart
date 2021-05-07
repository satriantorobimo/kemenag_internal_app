import 'package:kemenag_go_internal_app/asn/feature/data_kepagawaian/data/data_kepegawaian_model.dart';
import 'package:kemenag_go_internal_app/core/function/network_util.dart';
import 'package:kemenag_go_internal_app/core/resources/url_strings.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DataKepegawaianApiClient {
  DataKepegawaianModel dataKepegawaianModel;
  NetworkUtil netUtil = NetworkUtil();
  UrlString urlString = UrlString();

  Future<DataKepegawaianModel> getDataKepegawaian() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token');
    final Map<String, String> header = urlString.getHeaderTypeWithToken(token);
    return await netUtil
        .get(urlString.getUrlDataKepegawaian(), headers: header)
        .then((dynamic res) {
      print(res);
      dataKepegawaianModel = DataKepegawaianModel.fromJson(res);
      return dataKepegawaianModel;
    });
  }
}
