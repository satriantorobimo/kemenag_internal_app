import 'dart:async';

import 'package:kemenag_go_internal_app/asn/feature/data_kepagawaian/data/data_kepegawaian_model.dart';
import 'package:kemenag_go_internal_app/asn/feature/data_kepagawaian/domain/api/data_kepegawaian_api.dart';

class DataKepegawaianRepository {
  DataKepegawaianApiClient dataKepegawaianApiClient =
      DataKepegawaianApiClient();

  Future<DataKepegawaianModel> getDataKepegawaian() =>
      dataKepegawaianApiClient.getDataKepegawaian();
}
