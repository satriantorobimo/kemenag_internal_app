import 'package:kemenag_go_internal_app/core/function/network_util.dart';
import 'package:kemenag_go_internal_app/core/resources/url_strings.dart';
import 'package:kemenag_go_internal_app/non_asn/feature/profile/data/profile_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileApiClient {
  ProfileModel profileModel;
  NetworkUtil netUtil = NetworkUtil();
  UrlString urlString = UrlString();

  Future<ProfileModel> getProfile() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token');
    int id = prefs.getInt('id');
    final Map<String, String> header = urlString.getHeaderTypeWithToken(token);
    return await netUtil
        .get(urlString.getUrlGetProfile(id), headers: header)
        .then((dynamic res) {
      print(res);
      profileModel = ProfileModel.fromJson(res);
      return profileModel;
    });
  }
}
