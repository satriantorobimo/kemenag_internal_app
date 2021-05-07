import 'dart:convert';
import 'package:kemenag_go_internal_app/core/function/network_util.dart';
import 'package:kemenag_go_internal_app/core/resources/url_strings.dart';
import 'package:kemenag_go_internal_app/feature/daftar/data/model/daftar_request_data_model.dart';
import 'package:kemenag_go_internal_app/feature/daftar/data/model/register_model.dart';

class RegisterApiClient {
  RegisterModel registerModel;
  NetworkUtil netUtil = NetworkUtil();
  UrlString urlString = UrlString();

  Future<RegisterModel> registerAttempt(
      DaftarRequestDataModel daftarRequestDataModel) async {
    final Map<String, String> header = urlString.getHeaderType();
    final Map mapData = {};
    mapData['name'] = daftarRequestDataModel.nama;
    mapData['username'] = daftarRequestDataModel.username;
    mapData['email'] = daftarRequestDataModel.email;
    mapData['password'] = daftarRequestDataModel.password;
    mapData['is_admin'] = 1;
    final String _json = jsonEncode(mapData);
    return await netUtil
        .post(urlString.getUrlRegister(), headers: header, body: _json)
        .then((dynamic res) {
      print(res);
      registerModel = RegisterModel.fromJson(res);
      return registerModel;
    });
  }
}
