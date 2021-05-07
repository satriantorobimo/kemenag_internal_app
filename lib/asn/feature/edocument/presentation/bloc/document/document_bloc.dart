import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:kemenag_go_internal_app/asn/feature/edocument/data/model/add_document_model.dart';
import 'package:kemenag_go_internal_app/asn/feature/edocument/data/model/get_document_model.dart';
import 'package:kemenag_go_internal_app/asn/feature/edocument/domain/repo/document_repo.dart';

import 'bloc.dart';

class DocumentBloc extends Bloc<DocumentEvent, DocumentState> {
  DocumentBloc({@required this.documentRepository})
      : assert(documentRepository != null),
        super(DocumentInitial());

  DocumentRepository documentRepository;
  AddDocumentModel addDocumentModel;
  GetDocumentModel getDocumentModel;

  @override
  Stream<DocumentState> mapEventToState(
    DocumentEvent event,
  ) async* {
    if (event is AddDocument) {
      yield DocumentLoading();
      try {
        addDocumentModel =
            await documentRepository.addDoc(event.addDocumentData);
        if (addDocumentModel.status == 201) {
          yield DocumentAddLoaded(addDocumentModel: addDocumentModel);
        } else {
          yield DocumentError(error: 'expired');
        }
      } catch (e) {
        yield DocumentError(error: 'expired');
      }
    }
    if (event is GetDocument) {
      yield DocumentLoading();
      try {
        getDocumentModel = await documentRepository.getDoc();
        if (getDocumentModel.status == 200) {
          yield DocumentGetLoaded(getDocumentModel: getDocumentModel);
        } else {
          yield DocumentError(error: 'expired');
        }
      } catch (e) {
        yield DocumentError(error: 'expired');
      }
    }
  }
}
