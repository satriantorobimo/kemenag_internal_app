import 'dart:async';

import 'package:kemenag_go_internal_app/asn/feature/forum/data/comment_forum_model.dart';
import 'package:kemenag_go_internal_app/asn/feature/forum/data/forum_detail_model.dart';
import 'package:kemenag_go_internal_app/asn/feature/forum/data/comment_model.dart';
import 'package:kemenag_go_internal_app/asn/feature/forum/domain/api/forum_api.dart';
import 'package:kemenag_go_internal_app/asn/feature/forum/data/list_forum_model.dart';

class ForumRepository {
  ForumApiClient forumApiClient = ForumApiClient();

  Future<ListForumModel> getListForum() => forumApiClient.getListForum();

  Future<ForumDetailModel> getDetailForum(String id) =>
      forumApiClient.getDetailForum(id);

  Future<CommentForumModel> getComment(int id, int page) =>
      forumApiClient.getCommentForum(id, page);

  Future<ComentModel> addCommentForum(
          String id, String komentar, String fileName, String url) =>
      forumApiClient.addCommentForum(id, komentar, fileName, url);
}
