import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:kemenag_go_internal_app/asn/feature/edocument/data/model/add_document_model.dart';
import 'package:kemenag_go_internal_app/asn/feature/edocument/data/model/get_document_model.dart';

abstract class DocumentState extends Equatable {
  const DocumentState();

  @override
  List<Object> get props => [];
}

class DocumentInitial extends DocumentState {}

class DocumentLoading extends DocumentState {}

class DocumentAddLoaded extends DocumentState {
  final AddDocumentModel addDocumentModel;

  const DocumentAddLoaded({@required this.addDocumentModel})
      : assert(addDocumentModel != null);

  @override
  List<Object> get props => [addDocumentModel];
}

class DocumentGetLoaded extends DocumentState {
  final GetDocumentModel getDocumentModel;

  const DocumentGetLoaded({@required this.getDocumentModel})
      : assert(getDocumentModel != null);

  @override
  List<Object> get props => [getDocumentModel];
}

class DocumentError extends DocumentState {
  final String error;

  const DocumentError({@required this.error}) : assert(error != null);

  @override
  List<Object> get props => [error];
}
