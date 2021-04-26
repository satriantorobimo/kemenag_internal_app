import 'dart:convert';
import 'package:kemenag_go_internal_app/core/function/network_util.dart';
import 'package:kemenag_go_internal_app/core/resources/url_strings.dart';
import 'package:kemenag_go_internal_app/feature/login/data/model/login_model.dart';
import 'package:kemenag_go_internal_app/feature/login/data/model/login_request_data_model.dart';

class LoginApiClient {
  LoginModel loginModel;
  NetworkUtil netUtil = NetworkUtil();
  UrlString urlString = UrlString();

  Future<LoginModel> loginAttempt(
      LoginRequestDataModel loginRequestDataModel) async {
    final Map<String, String> header = urlString.getHeaderType();
    final Map mapData = {};
    mapData['username'] = loginRequestDataModel.email;
    mapData['password'] = loginRequestDataModel.password;
    final String _json = jsonEncode(mapData);
    return await netUtil
        .post(urlString.getUrlLogin(), headers: header, body: _json)
        .then((dynamic res) {
      print(res);
      loginModel = LoginModel.fromJson(res);
      return loginModel;
    }).catchError((dynamic onError) {
      return onError;
    });
  }
}
