import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:kemenag_go_internal_app/feature/daftar/data/model/register_model.dart';
import 'package:kemenag_go_internal_app/feature/daftar/domain/repo/register_repo.dart';
import 'bloc.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc({@required this.registerRepository})
      : assert(registerRepository != null),
        super(RegisterInitial());

  RegisterRepository registerRepository;
  RegisterModel registerModel;

  @override
  Stream<RegisterState> mapEventToState(
    RegisterEvent event,
  ) async* {
    if (event is AttempRegister) {
      yield RegisterLoading();
      try {
        registerModel = await registerRepository
            .registerAttempt(event.daftarRequestDataModel);
        if (registerModel.status == 201) {
          yield RegisterLoaded(registerModel: registerModel);
        } else {
          yield RegisterError(error: 'Akun anda sudah terdaftar');
        }
      } catch (e) {
        yield RegisterError(error: 'expired');
      }
    }
  }
}
