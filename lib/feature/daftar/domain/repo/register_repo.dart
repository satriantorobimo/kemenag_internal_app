import 'dart:async';

import 'package:kemenag_go_internal_app/feature/daftar/data/model/daftar_request_data_model.dart';
import 'package:kemenag_go_internal_app/feature/daftar/data/model/register_model.dart';
import 'package:kemenag_go_internal_app/feature/daftar/domain/api/register_api.dart';

class RegisterRepository {
  RegisterApiClient registerApiClient = RegisterApiClient();

  Future<RegisterModel> registerAttempt(
          DaftarRequestDataModel daftarRequestDataModel) =>
      registerApiClient.registerAttempt(daftarRequestDataModel);
}
