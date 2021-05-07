import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:kemenag_go_internal_app/asn/feature/forum/data/upload_response_model.dart';

abstract class UploadFileState extends Equatable {
  const UploadFileState();

  @override
  List<Object> get props => [];
}

class UploadFileInitial extends UploadFileState {}

class UploadFileLoading extends UploadFileState {}

class UploadFileLoaded extends UploadFileState {
  final UploadFileResponse uploadFileResponse;

  const UploadFileLoaded({@required this.uploadFileResponse})
      : assert(uploadFileResponse != null);

  @override
  List<Object> get props => [uploadFileResponse];
}

class UploadFileError extends UploadFileState {
  final String error;

  const UploadFileError({@required this.error}) : assert(error != null);

  @override
  List<Object> get props => [error];
}
