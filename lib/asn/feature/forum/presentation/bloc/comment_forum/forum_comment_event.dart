import 'package:equatable/equatable.dart';

abstract class CommentForumEvent extends Equatable {
  const CommentForumEvent();

  @override
  List<Object> get props => [];
}

class GetComentForum extends CommentForumEvent {
  final int id;
  final int page;

  GetComentForum(this.id, this.page);
  @override
  List<Object> get props => [];
}
