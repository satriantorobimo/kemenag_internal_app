import 'dart:convert';

import 'package:kemenag_go_internal_app/asn/feature/edocument/data/model/add_document_data_model.dart';
import 'package:kemenag_go_internal_app/asn/feature/edocument/data/model/add_document_model.dart';
import 'package:kemenag_go_internal_app/asn/feature/edocument/data/model/get_document_model.dart';
import 'package:kemenag_go_internal_app/core/function/network_util.dart';
import 'package:kemenag_go_internal_app/core/resources/url_strings.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DocumentApiClient {
  AddDocumentModel addDocumentModel;
  GetDocumentModel getDocumentModel;
  NetworkUtil netUtil = NetworkUtil();
  UrlString urlString = UrlString();

  Future<AddDocumentModel> addDoc(AddDocumentData addDocumentData) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token');
    final Map mapData = {};
    print('aaa ${addDocumentData.dir}');
    mapData['file_name'] = addDocumentData.fileName;
    mapData['url_file'] = addDocumentData.urlFile;
    mapData['note'] = addDocumentData.note;
    mapData['group'] = addDocumentData.dir;
    final String _json = jsonEncode(mapData);
    final Map<String, String> header = urlString.getHeaderTypeWithToken(token);
    return await netUtil
        .post(urlString.getUrlAddDoc(), headers: header, body: _json)
        .then((dynamic res) {
      print(res);
      addDocumentModel = AddDocumentModel.fromJson(res);
      return addDocumentModel;
    });
  }

  Future<GetDocumentModel> getDoc() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token');
    final Map<String, String> header = urlString.getHeaderTypeWithToken(token);
    return await netUtil
        .get(urlString.getUrlAddDoc(), headers: header)
        .then((dynamic res) {
      print(res);
      getDocumentModel = GetDocumentModel.fromJson(res);
      return getDocumentModel;
    });
  }
}
