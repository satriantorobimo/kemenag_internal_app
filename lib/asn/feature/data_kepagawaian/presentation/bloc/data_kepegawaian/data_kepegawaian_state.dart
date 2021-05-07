import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:kemenag_go_internal_app/asn/feature/data_kepagawaian/data/data_kepegawaian_model.dart';

abstract class DataKepegawaianState extends Equatable {
  const DataKepegawaianState();

  @override
  List<Object> get props => [];
}

class DataKepegawaianInitial extends DataKepegawaianState {}

class DataKepegawaianLoading extends DataKepegawaianState {}

class DataKepegawaianLoaded extends DataKepegawaianState {
  final DataKepegawaianModel dataKepegawaianModel;

  const DataKepegawaianLoaded({@required this.dataKepegawaianModel})
      : assert(dataKepegawaianModel != null);

  @override
  List<Object> get props => [dataKepegawaianModel];
}

class DataKepegawaianError extends DataKepegawaianState {
  final String error;

  const DataKepegawaianError({@required this.error}) : assert(error != null);

  @override
  List<Object> get props => [error];
}
