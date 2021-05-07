import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:kemenag_go_internal_app/asn/feature/forum/data/comment_forum_model.dart';
import 'package:kemenag_go_internal_app/asn/feature/forum/domain/repo/forum_repo.dart';
import 'bloc.dart';
import 'package:rxdart/rxdart.dart';

class CommentForumBloc extends Bloc<CommentForumEvent, CommentForumState> {
  CommentForumBloc({@required this.forumRepository})
      : assert(forumRepository != null),
        super(CommentForumInitial());

  ForumRepository forumRepository = ForumRepository();
  CommentForumModel forumDetailModel;

  @override
  Stream<Transition<CommentForumEvent, CommentForumState>> transformEvents(
    Stream<CommentForumEvent> events,
    TransitionFunction<CommentForumEvent, CommentForumState> transitionFn,
  ) {
    return super.transformEvents(
      events.debounceTime(const Duration(milliseconds: 500)),
      transitionFn,
    );
  }

  @override
  Stream<CommentForumState> mapEventToState(
    CommentForumEvent event,
  ) async* {
    final CommentForumState currentState = state;
    if (event is GetComentForum && !_hasReachedMax(currentState)) {
      try {
        if (currentState is CommentForumInitial) {
          forumDetailModel =
              await forumRepository.getComment(event.id, event.page);
          if (forumDetailModel.data != null)
            yield CommentForumLoaded(
                forumDetailModel: forumDetailModel.data.comments_paginate.data,
                hasReachedMax: false);
          else
            yield CommentForumError(error: 'no_data');

          return;
        }
        if (currentState is CommentForumLoaded) {
          forumDetailModel =
              await forumRepository.getComment(event.id, event.page);
          yield forumDetailModel.data.comments_paginate.data == null
              ? currentState.copyWith(hasReachedMax: true)
              : CommentForumLoaded(
                  forumDetailModel: currentState.forumDetailModel +
                      forumDetailModel.data.comments_paginate.data,
                  hasReachedMax: false,
                );
        }
      } catch (e) {
        print(e);
        yield CommentForumError(error: e.toString());
      }
    }
  }

  bool _hasReachedMax(CommentForumState state) =>
      state is CommentForumLoaded && state.hasReachedMax;
}
