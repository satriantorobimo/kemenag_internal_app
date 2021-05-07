import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:kemenag_go_internal_app/asn/feature/forum/data/comment_forum_model.dart';

abstract class CommentForumState extends Equatable {
  const CommentForumState();

  @override
  List<Object> get props => [];
}

class CommentForumInitial extends CommentForumState {}

class CommentForumLoading extends CommentForumState {}

class CommentForumLoaded extends CommentForumState {
  final List<Datas> forumDetailModel;
  final bool hasReachedMax;

  const CommentForumLoaded(
      {@required this.forumDetailModel, this.hasReachedMax});

  CommentForumLoaded copyWith({
    List<Datas> post,
    bool hasReachedMax,
  }) {
    return CommentForumLoaded(
      forumDetailModel: post ?? forumDetailModel,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  List<Object> get props => [forumDetailModel, hasReachedMax];
}

class CommentForumError extends CommentForumState {
  final String error;

  const CommentForumError({@required this.error}) : assert(error != null);

  @override
  List<Object> get props => [error];
}
