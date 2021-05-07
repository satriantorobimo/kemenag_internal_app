import 'package:equatable/equatable.dart';

abstract class UploadFileEvent extends Equatable {
  const UploadFileEvent();

  @override
  List<Object> get props => [];
}

class UploadFile extends UploadFileEvent {
  final String fileName;

  UploadFile(this.fileName);
  @override
  List<Object> get props => [fileName];
}
