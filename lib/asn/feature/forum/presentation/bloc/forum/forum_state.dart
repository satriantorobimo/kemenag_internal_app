import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:kemenag_go_internal_app/asn/feature/forum/data/comment_model.dart';
import 'package:kemenag_go_internal_app/asn/feature/forum/data/forum_detail_model.dart'
    as ForumDetail;
import 'package:kemenag_go_internal_app/asn/feature/forum/data/list_forum_model.dart';

abstract class ForumState extends Equatable {
  const ForumState();

  @override
  List<Object> get props => [];
}

class ForumInitial extends ForumState {}

class ForumLoading extends ForumState {}

class ForumLoaded extends ForumState {
  final ListForumModel listForumModel;

  const ForumLoaded({@required this.listForumModel})
      : assert(listForumModel != null);

  @override
  List<Object> get props => [listForumModel];
}

class ForumDetailLoaded extends ForumState {
  final ForumDetail.ForumDetailModel forumDetailModel;

  const ForumDetailLoaded({@required this.forumDetailModel});

  @override
  List<Object> get props => [forumDetailModel];
}

class ForumCommentLoaded extends ForumState {
  final List<ForumDetail.Datas> forumDetailModel;
  final bool hasReachedMax;

  const ForumCommentLoaded(
      {@required this.forumDetailModel, this.hasReachedMax});

  ForumCommentLoaded copyWith({
    List<ForumDetail.Datas> post,
    bool hasReachedMax,
  }) {
    return ForumCommentLoaded(
      forumDetailModel: post ?? forumDetailModel,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  List<Object> get props => [forumDetailModel, hasReachedMax];
}

class AddCommentLoaded extends ForumState {
  final ComentModel comentModel;

  const AddCommentLoaded({@required this.comentModel})
      : assert(comentModel != null);

  @override
  List<Object> get props => [comentModel];
}

class ForumError extends ForumState {
  final String error;

  const ForumError({@required this.error}) : assert(error != null);

  @override
  List<Object> get props => [error];
}
