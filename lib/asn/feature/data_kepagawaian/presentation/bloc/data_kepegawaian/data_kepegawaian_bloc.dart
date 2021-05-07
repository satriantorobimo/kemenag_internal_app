import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:kemenag_go_internal_app/asn/feature/data_kepagawaian/data/data_kepegawaian_model.dart';
import 'package:kemenag_go_internal_app/asn/feature/data_kepagawaian/domain/repo/data_kepegawaian_repo.dart';
import 'bloc.dart';

class DataKepegawaianBloc
    extends Bloc<DataKepegawaianEvent, DataKepegawaianState> {
  DataKepegawaianBloc({@required this.dataKepegawaianRepository})
      : assert(dataKepegawaianRepository != null),
        super(DataKepegawaianInitial());

  DataKepegawaianRepository dataKepegawaianRepository;
  DataKepegawaianModel dataKepegawaianModel;

  @override
  Stream<DataKepegawaianState> mapEventToState(
    DataKepegawaianEvent event,
  ) async* {
    if (event is GetDataKepegawaian) {
      yield DataKepegawaianLoading();
      try {
        dataKepegawaianModel =
            await dataKepegawaianRepository.getDataKepegawaian();
        if (dataKepegawaianModel.status == 200) {
          yield DataKepegawaianLoaded(
              dataKepegawaianModel: dataKepegawaianModel);
        } else {
          yield DataKepegawaianError(error: 'expired');
        }
      } catch (e) {
        yield DataKepegawaianError(error: 'expired');
      }
    }
  }
}
