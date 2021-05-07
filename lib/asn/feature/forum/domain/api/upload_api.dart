import 'package:kemenag_go_internal_app/asn/feature/forum/data/upload_response_model.dart';
import 'package:kemenag_go_internal_app/core/function/network_util.dart';
import 'package:kemenag_go_internal_app/core/resources/url_strings.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UploadApiClient {
  UploadFileResponse uploadFileResponse;
  NetworkUtil netUtil = NetworkUtil();
  UrlString urlString = UrlString();

  Future<UploadFileResponse> uploadFile(String fileName) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token');
    return await netUtil
        .postMultiPart(urlString.getUrlUploadFile(), fileName, token)
        .then((dynamic res) {
      uploadFileResponse = UploadFileResponse.fromJson(res);
      return uploadFileResponse;
    });
  }
}
