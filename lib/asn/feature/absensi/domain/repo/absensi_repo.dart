import 'dart:async';

import 'package:kemenag_go_internal_app/asn/feature/absensi/data/model/absensi_model.dart';
import 'package:kemenag_go_internal_app/asn/feature/absensi/data/model/absensi_monthly_model.dart';
import 'package:kemenag_go_internal_app/asn/feature/absensi/data/model/absensi_today_model.dart';
import 'package:kemenag_go_internal_app/asn/feature/absensi/domain/api/absensi_api.dart';
import 'package:kemenag_go_internal_app/asn/feature/absensi/data/model/argument_absen_model.dart';

class AbsensiRepository {
  AbsensiApiClient absensiApiClient = AbsensiApiClient();

  Future<AbsensiTodayModel> getAbsensiToday() =>
      absensiApiClient.getAbsensiToday();

  Future<AbsensiModel> attemptAbsensi(ArgumentAbsenModel argumentAbsenModel) =>
      absensiApiClient.attemptAbsensi(argumentAbsenModel);

  Future<AbsensiMonthlyModel> getAbsensiMonthly() =>
      absensiApiClient.getAbsensiMonthly();
}
