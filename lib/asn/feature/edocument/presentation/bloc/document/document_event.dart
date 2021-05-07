import 'package:equatable/equatable.dart';
import 'package:kemenag_go_internal_app/asn/feature/edocument/data/model/add_document_data_model.dart';

abstract class DocumentEvent extends Equatable {
  const DocumentEvent();

  @override
  List<Object> get props => [];
}

class AddDocument extends DocumentEvent {
  final AddDocumentData addDocumentData;
  AddDocument(this.addDocumentData);
  @override
  List<Object> get props => [addDocumentData];
}

class GetDocument extends DocumentEvent {
  @override
  List<Object> get props => [];
}
