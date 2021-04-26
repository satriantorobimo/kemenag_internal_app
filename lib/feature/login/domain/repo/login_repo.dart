import 'dart:async';

import 'package:kemenag_go_internal_app/feature/login/data/model/login_model.dart';
import 'package:kemenag_go_internal_app/feature/login/data/model/login_request_data_model.dart';
import 'package:kemenag_go_internal_app/feature/login/domain/api/login_api.dart';

class LoginRepository {
  LoginApiClient loginApiClient = LoginApiClient();

  Future<LoginModel> loginAttempt(
          LoginRequestDataModel loginRequestDataModel) =>
      loginApiClient.loginAttempt(loginRequestDataModel);
}
