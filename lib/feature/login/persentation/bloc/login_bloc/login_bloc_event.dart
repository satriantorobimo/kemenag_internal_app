import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:kemenag_go_internal_app/feature/login/data/model/login_request_data_model.dart';

@immutable
abstract class LoginBlocEvent extends Equatable {
  const LoginBlocEvent();
}

class LoginAttempt extends LoginBlocEvent {
  const LoginAttempt(this.loginRequestDataModel);
  final LoginRequestDataModel loginRequestDataModel;

  @override
  List<Object> get props => [];
}
