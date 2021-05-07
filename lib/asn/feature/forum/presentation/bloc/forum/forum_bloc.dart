import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:kemenag_go_internal_app/asn/feature/forum/data/comment_model.dart';
import 'package:kemenag_go_internal_app/asn/feature/forum/data/forum_detail_model.dart';
import 'package:kemenag_go_internal_app/asn/feature/forum/domain/repo/forum_repo.dart';
import 'bloc.dart';
import 'package:kemenag_go_internal_app/asn/feature/forum/data/list_forum_model.dart';
import 'package:rxdart/rxdart.dart';

class ForumBloc extends Bloc<ForumEvent, ForumState> {
  ForumBloc({@required this.forumRepository})
      : assert(forumRepository != null),
        super(ForumInitial());

  ForumRepository forumRepository = ForumRepository();
  ListForumModel listForumModel;
  ForumDetailModel forumDetailModel;
  ComentModel comentModel;

  @override
  Stream<Transition<ForumEvent, ForumState>> transformEvents(
    Stream<ForumEvent> events,
    TransitionFunction<ForumEvent, ForumState> transitionFn,
  ) {
    return super.transformEvents(
      events.debounceTime(const Duration(milliseconds: 500)),
      transitionFn,
    );
  }

  @override
  Stream<ForumState> mapEventToState(
    ForumEvent event,
  ) async* {
    if (event is GetListForum) {
      yield ForumLoading();
      try {
        listForumModel = await forumRepository.getListForum();
        if (listForumModel.status == 200) {
          yield ForumLoaded(listForumModel: listForumModel);
        } else {
          yield ForumError(error: 'expired');
        }
      } catch (e) {
        yield ForumError(error: 'expired');
      }
    }
    if (event is GetDetailForum) {
      yield ForumLoading();
      try {
        forumDetailModel = await forumRepository.getDetailForum(event.id);
        yield ForumDetailLoaded(forumDetailModel: forumDetailModel);
      } catch (e) {
        yield ForumError(error: 'expired');
      }
    }

    if (event is AddCommentForum) {
      yield ForumLoading();
      try {
        comentModel = await forumRepository.addCommentForum(
            event.id, event.komentar, event.fileName, event.url);
        yield AddCommentLoaded(comentModel: comentModel);
      } catch (e) {
        yield ForumError(error: 'expired');
      }
    }
  }

  bool _hasReachedMax(ForumState state) =>
      state is ForumCommentLoaded && state.hasReachedMax;
}
