import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:kemenag_go_internal_app/feature/login/data/model/login_model.dart';
import 'package:kemenag_go_internal_app/feature/login/domain/repo/login_repo.dart';

import 'bloc.dart';

class LoginBlocBloc extends Bloc<LoginBlocEvent, LoginBlocState> {
  LoginBlocBloc({@required this.loginRepo})
      : assert(loginRepo != null),
        super(LoginBlocInitial());

  LoginRepository loginRepo = LoginRepository();
  LoginModel loginModel;

  @override
  Stream<LoginBlocState> mapEventToState(
    LoginBlocEvent event,
  ) async* {
    if (event is LoginAttempt) {
      yield LoginLoading();
      try {
        loginModel = await loginRepo.loginAttempt(event.loginRequestDataModel);
        if (loginModel.access_token != null)
          yield LoginLoaded(loginModel: loginModel);
        else
          yield LoginError(error: 'Email atau Password anda masukkan Salah');
      } catch (e) {
        yield LoginError(error: e.toString());
      }
    }
  }
}
