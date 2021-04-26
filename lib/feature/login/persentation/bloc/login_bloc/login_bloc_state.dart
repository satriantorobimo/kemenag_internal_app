import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:kemenag_go_internal_app/feature/login/data/model/login_model.dart';

@immutable
abstract class LoginBlocState extends Equatable {
  const LoginBlocState();

  @override
  List<Object> get props => [];
}

class LoginBlocInitial extends LoginBlocState {}

class LoginLoading extends LoginBlocState {}

class LoginLoaded extends LoginBlocState {
  final LoginModel loginModel;

  const LoginLoaded({@required this.loginModel}) : assert(loginModel != null);

  @override
  List<Object> get props => [loginModel];
}

class LoginError extends LoginBlocState {
  final String error;

  const LoginError({@required this.error}) : assert(error != null);

  @override
  List<Object> get props => [error];
}
