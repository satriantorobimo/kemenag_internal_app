import 'dart:convert';

import 'package:kemenag_go_internal_app/asn/feature/forum/data/comment_forum_model.dart';
import 'package:kemenag_go_internal_app/asn/feature/forum/data/comment_model.dart';
import 'package:kemenag_go_internal_app/asn/feature/forum/data/forum_detail_model.dart';
import 'package:kemenag_go_internal_app/asn/feature/forum/data/list_forum_model.dart';
import 'package:kemenag_go_internal_app/core/function/network_util.dart';
import 'package:kemenag_go_internal_app/core/resources/url_strings.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ForumApiClient {
  ListForumModel listForumModel;
  ForumDetailModel forumDetailModel;
  ComentModel comentModel;
  CommentForumModel commentForumModel;
  NetworkUtil netUtil = NetworkUtil();
  UrlString urlString = UrlString();
  final JsonDecoder _decoder = const JsonDecoder();

  Future<ListForumModel> getListForum() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token');
    final Map<String, String> header = urlString.getHeaderTypeWithToken(token);
    return await netUtil
        .get(urlString.getUrlListForum(), headers: header)
        .then((dynamic res) {
      print(res);
      listForumModel = ListForumModel.fromJson(res);
      return listForumModel;
    });
  }

  Future<ForumDetailModel> getDetailForum(String id) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token');
    final Map<String, String> header = urlString.getHeaderTypeWithToken(token);
    print('IIIDDD $id');
    return await netUtil
        .get(urlString.getUrlListForumDetail(id), headers: header)
        .then((dynamic res) {
      print(res);
      forumDetailModel = ForumDetailModel.fromJson(res);
      return forumDetailModel;
    });
  }

  Future<CommentForumModel> getCommentForum(int id, int page) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token');
    final Map<String, String> header = urlString.getHeaderTypeWithToken(token);
    return await netUtil
        .get(urlString.getUrlListForumDetailPagination(id, page),
            headers: header)
        .then((dynamic res) {
      print(res);
      commentForumModel = CommentForumModel.fromJson(res);
      return commentForumModel;
    });
  }

  Future<ComentModel> addCommentForum(
      String id, String komentar, String fileName, String url) async {
    String arrayObjsText = '[{"file_name": "$fileName", "url": "$url"}]';

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token');
    final Map<String, String> header = urlString.getHeaderTypeWithToken(token);
    final Map mapData = {};
    mapData['message'] = komentar;
    mapData['comment_files'] = _decoder.convert(arrayObjsText);
    final String _json = jsonEncode(mapData);
    return await netUtil
        .put(urlString.getUrlListForumDetail(id), headers: header, body: _json)
        .then((dynamic res) {
      print(res);
      comentModel = ComentModel.fromJson(res);
      return comentModel;
    });
  }
}
