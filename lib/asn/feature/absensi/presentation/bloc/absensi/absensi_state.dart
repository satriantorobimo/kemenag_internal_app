import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:kemenag_go_internal_app/asn/feature/absensi/data/model/absensi_model.dart';
import 'package:kemenag_go_internal_app/asn/feature/absensi/data/model/absensi_monthly_model.dart';
import 'package:kemenag_go_internal_app/asn/feature/absensi/data/model/absensi_today_model.dart';

abstract class AbsensiState extends Equatable {
  const AbsensiState();

  @override
  List<Object> get props => [];
}

class AbsensiInitial extends AbsensiState {}

class AbsensiLoading extends AbsensiState {}

class AbsensiTodayLoaded extends AbsensiState {
  final AbsensiTodayModel absensiTodayModel;

  const AbsensiTodayLoaded({@required this.absensiTodayModel})
      : assert(absensiTodayModel != null);

  @override
  List<Object> get props => [absensiTodayModel];
}

class AbsensiMonthLoaded extends AbsensiState {
  final AbsensiMonthlyModel absensiMonthlyModel;

  const AbsensiMonthLoaded({@required this.absensiMonthlyModel})
      : assert(absensiMonthlyModel != null);

  @override
  List<Object> get props => [absensiMonthlyModel];
}

class AbsensiLoaded extends AbsensiState {
  final AbsensiModel absensiModel;

  const AbsensiLoaded({@required this.absensiModel})
      : assert(absensiModel != null);

  @override
  List<Object> get props => [absensiModel];
}

class AbsensiTodayError extends AbsensiState {
  final String error;

  const AbsensiTodayError({@required this.error}) : assert(error != null);

  @override
  List<Object> get props => [error];
}

class AbsensiMonthError extends AbsensiState {
  final String error;

  const AbsensiMonthError({@required this.error}) : assert(error != null);

  @override
  List<Object> get props => [error];
}

class AbsensiError extends AbsensiState {
  final String error;

  const AbsensiError({@required this.error}) : assert(error != null);

  @override
  List<Object> get props => [error];
}
