import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:kemenag_go_internal_app/feature/daftar/data/model/register_model.dart';

abstract class RegisterState extends Equatable {
  const RegisterState();

  @override
  List<Object> get props => [];
}

class RegisterInitial extends RegisterState {}

class RegisterLoading extends RegisterState {}

class RegisterLoaded extends RegisterState {
  final RegisterModel registerModel;

  const RegisterLoaded({@required this.registerModel})
      : assert(registerModel != null);

  @override
  List<Object> get props => [registerModel];
}

class RegisterError extends RegisterState {
  final String error;

  const RegisterError({@required this.error}) : assert(error != null);

  @override
  List<Object> get props => [error];
}
