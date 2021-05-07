import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:kemenag_go_internal_app/asn/feature/forum/data/upload_response_model.dart';
import 'package:kemenag_go_internal_app/asn/feature/forum/domain/repo/upload_repo.dart';
import 'bloc.dart';

class UploadFileBloc extends Bloc<UploadFileEvent, UploadFileState> {
  UploadFileBloc({@required this.uploadRepository})
      : assert(uploadRepository != null),
        super(UploadFileInitial());

  UploadRepository uploadRepository;
  UploadFileResponse uploadFileResponse;

  @override
  Stream<UploadFileState> mapEventToState(
    UploadFileEvent event,
  ) async* {
    if (event is UploadFile) {
      yield UploadFileLoading();
      try {
        uploadFileResponse = await uploadRepository.uploadFile(event.fileName);
        if (uploadFileResponse.data != null) {
          yield UploadFileLoaded(uploadFileResponse: uploadFileResponse);
        }
      } catch (e) {
        yield UploadFileError(error: 'Size terlalu besar');
      }
    }
  }
}
