import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:kemenag_go_internal_app/asn/feature/absensi/data/model/absensi_model.dart';
import 'package:kemenag_go_internal_app/asn/feature/absensi/data/model/absensi_monthly_model.dart';
import 'package:kemenag_go_internal_app/asn/feature/absensi/data/model/absensi_today_model.dart';
import 'package:kemenag_go_internal_app/asn/feature/absensi/domain/repo/absensi_repo.dart';
import 'bloc.dart';

class AbsensiBloc extends Bloc<AbsensiEvent, AbsensiState> {
  AbsensiBloc({@required this.absensiRepository})
      : assert(absensiRepository != null),
        super(AbsensiInitial());

  AbsensiRepository absensiRepository;
  AbsensiTodayModel absensiTodayModel;
  AbsensiModel absensiModel;
  AbsensiMonthlyModel absensiMonthlyModel;

  @override
  Stream<AbsensiState> mapEventToState(
    AbsensiEvent event,
  ) async* {
    if (event is GetAbsensiToday) {
      yield AbsensiLoading();
      try {
        absensiTodayModel = await absensiRepository.getAbsensiToday();
        if (absensiTodayModel.status == 200) {
          yield AbsensiTodayLoaded(absensiTodayModel: absensiTodayModel);
        } else if (absensiTodayModel.status == 401) {
          yield AbsensiTodayError(error: 'expired');
        }
      } catch (e) {
        yield AbsensiTodayError(error: 'expired');
      }
    }
    if (event is AttemptAbsensi) {
      yield AbsensiLoading();
      try {
        absensiModel =
            await absensiRepository.attemptAbsensi(event.argumentAbsenModel);
        if (absensiModel.status == 200) {
          yield AbsensiLoaded(absensiModel: absensiModel);
        } else if (absensiModel.status == 401) {
          yield AbsensiError(error: 'expired');
        }
      } catch (e) {
        yield AbsensiTodayError(error: 'expired');
      }
    }

    if (event is GetAbsensiMonth) {
      yield AbsensiLoading();
      try {
        absensiMonthlyModel = await absensiRepository.getAbsensiMonthly();
        if (absensiMonthlyModel.status == 200) {
          yield AbsensiMonthLoaded(absensiMonthlyModel: absensiMonthlyModel);
        } else if (absensiModel.status == 401) {
          yield AbsensiError(error: 'expired');
        }
      } catch (e) {
        yield AbsensiTodayError(error: 'expired');
      }
    }
  }
}
