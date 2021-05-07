import 'package:equatable/equatable.dart';

abstract class ForumEvent extends Equatable {
  const ForumEvent();

  @override
  List<Object> get props => [];
}

class GetListForum extends ForumEvent {
  @override
  List<Object> get props => [];
}

class GetDetailForum extends ForumEvent {
  final String id;

  GetDetailForum(this.id);
  @override
  List<Object> get props => [];
}

class AddCommentForum extends ForumEvent {
  final String id;
  final String komentar;
  final String fileName;
  final String url;

  AddCommentForum(this.id, this.komentar, this.fileName, this.url);
  @override
  List<Object> get props => [];
}
