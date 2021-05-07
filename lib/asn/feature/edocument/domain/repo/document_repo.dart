import 'dart:async';

import 'package:kemenag_go_internal_app/asn/feature/edocument/data/model/add_document_data_model.dart';
import 'package:kemenag_go_internal_app/asn/feature/edocument/data/model/add_document_model.dart';
import 'package:kemenag_go_internal_app/asn/feature/edocument/data/model/get_document_model.dart';
import 'package:kemenag_go_internal_app/asn/feature/edocument/domain/api/document_api.dart';

class DocumentRepository {
  DocumentApiClient documentApiClient = DocumentApiClient();

  Future<AddDocumentModel> addDoc(AddDocumentData addDocumentData) =>
      documentApiClient.addDoc(addDocumentData);

  Future<GetDocumentModel> getDoc() => documentApiClient.getDoc();
}
