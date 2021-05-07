import 'dart:convert';

import 'package:kemenag_go_internal_app/asn/feature/absensi/data/model/absensi_model.dart';
import 'package:kemenag_go_internal_app/asn/feature/absensi/data/model/absensi_monthly_model.dart';
import 'package:kemenag_go_internal_app/asn/feature/absensi/data/model/absensi_today_model.dart';
import 'package:kemenag_go_internal_app/asn/feature/absensi/data/model/argument_absen_model.dart';
import 'package:kemenag_go_internal_app/core/function/network_util.dart';
import 'package:kemenag_go_internal_app/core/resources/url_strings.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AbsensiApiClient {
  AbsensiTodayModel absensiTodayModel;
  AbsensiModel absensiModel;
  AbsensiMonthlyModel absensiMonthlyModel;
  NetworkUtil netUtil = NetworkUtil();
  UrlString urlString = UrlString();

  Future<AbsensiTodayModel> getAbsensiToday() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token');
    final Map<String, String> header = urlString.getHeaderTypeWithToken(token);
    return await netUtil
        .get(urlString.getUrlAttendaceToday(), headers: header)
        .then((dynamic res) {
      print(res);
      absensiTodayModel = AbsensiTodayModel.fromJson(res);
      return absensiTodayModel;
    });
  }

  Future<AbsensiMonthlyModel> getAbsensiMonthly() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token');
    final Map<String, String> header = urlString.getHeaderTypeWithToken(token);
    return await netUtil
        .get(urlString.getUrlAttendaceMonthly(), headers: header)
        .then((dynamic res) {
      print(res);
      absensiMonthlyModel = AbsensiMonthlyModel.fromJson(res);
      return absensiMonthlyModel;
    });
  }

  Future<AbsensiModel> attemptAbsensi(
      ArgumentAbsenModel argumentAbsenModel) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token');
    final Map<String, String> header = urlString.getHeaderTypeWithToken(token);
    final Map mapData = {};
    mapData['lat'] = argumentAbsenModel.lat;
    mapData['lon'] = argumentAbsenModel.long;
    mapData['working_type'] = argumentAbsenModel.type;
    final String _json = jsonEncode(mapData);
    return await netUtil
        .post(urlString.getUrlAttendace(), headers: header, body: _json)
        .then((dynamic res) {
      print(res);
      absensiModel = AbsensiModel.fromJson(res);
      return absensiModel;
    });
  }
}
