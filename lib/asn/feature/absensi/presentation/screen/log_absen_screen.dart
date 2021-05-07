import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:indonesia/indonesia.dart';
import 'package:intl/intl.dart';
import 'package:kemenag_go_internal_app/asn/feature/absensi/data/model/absensi_monthly_model.dart';
import 'package:kemenag_go_internal_app/asn/feature/absensi/domain/repo/absensi_repo.dart';
import 'package:kemenag_go_internal_app/asn/feature/absensi/presentation/bloc/absensi/bloc.dart';
import 'package:kemenag_go_internal_app/asn/feature/profile/presentation/widget/label_and_value_widget.dart';
import 'package:kemenag_go_internal_app/core/design_system/colors.dart';
import 'package:kemenag_go_internal_app/core/resources/routes.dart';
import 'package:kemenag_go_internal_app/core/util/custom_loader.dart';

class LogAbsenScreen extends StatefulWidget {
  LogAbsenScreen({Key key}) : super(key: key);

  @override
  _LogAbsenScreenState createState() => _LogAbsenScreenState();
}

class _LogAbsenScreenState extends State<LogAbsenScreen> {
  AbsensiBloc absensiBloc = AbsensiBloc(absensiRepository: AbsensiRepository());
  final GlobalKey<State> _keyLoader = GlobalKey<State>();
  Widget appBarTitle = Text(
    'Log Absen',
    style: TextStyle(color: Colors.black, fontSize: 16),
  );

  @override
  void initState() {
    absensiBloc.add(GetAbsensiMonth());
    super.initState();
  }

  @override
  void dispose() {
    absensiBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppBar(context),
        body: BlocListener<AbsensiBloc, AbsensiState>(
          cubit: absensiBloc,
          listener: (_, AbsensiState state) {
            if (state is AbsensiLoading) {
              LoaderDialogs.showLoadingDialog(context, _keyLoader);
            }
            if (state is AbsensiMonthLoaded) {
              Navigator.of(_keyLoader.currentContext, rootNavigator: true)
                  .pop();
            }
            if (state is AbsensiMonthError) {
              Navigator.of(_keyLoader.currentContext, rootNavigator: true)
                  .pop();
              if (state.error == 'expired') {
                print('expired');
                Navigator.pushNamed(context, loginRoute);
              }
            }
          },
          child: BlocBuilder<AbsensiBloc, AbsensiState>(
              cubit: absensiBloc,
              builder: (_, AbsensiState state) {
                if (state is AbsensiInitial) {
                  return Container();
                }
                if (state is AbsensiLoading) {
                  return Container();
                }
                if (state is AbsensiMonthLoaded) {
                  return _mainContent(state.absensiMonthlyModel);
                }
                if (state is AbsensiMonthError) {
                  return Container();
                }
                return Container();
              }),
        ));
  }

  Widget _mainContent(AbsensiMonthlyModel absensiMonthlyModel) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView.separated(
          separatorBuilder: (BuildContext context, int index) {
            return SizedBox(height: 16);
          },
          itemCount: absensiMonthlyModel.data.length,
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            return _buildItemList(absensiMonthlyModel.data[index], context);
          }),
    );
  }

  Widget _buildItemList(Data data, BuildContext context) {
    DateTime tempDate;
    String date;
    String formattedTimeMasuk;
    String formattedTimePulang;
    if (data.dt != null) {
      tempDate = DateFormat("yyyy-MM-dd").parse(data.dt);
      date = tanggal(tempDate);
    } else {
      date = '-';
    }
    if (data.jamMsk != null) {
      String dateMasuk = data.jamMsk;
      DateTime tempDateMasuk =
          DateFormat('yyyy-MM-dd HH:mm:ss').parse(dateMasuk);
      formattedTimeMasuk = DateFormat('HH:mm').format(tempDateMasuk);
    } else {
      formattedTimeMasuk = '-';
    }
    if (data.jamPlg != null) {
      String datePulang = data.jamPlg;
      DateTime tempDatePulang =
          DateFormat('yyyy-MM-dd HH:mm:ss').parse(datePulang);
      formattedTimePulang = DateFormat('HH:mm').format(tempDatePulang);
    } else {
      formattedTimePulang = '-';
    }
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Theme(
        data: Theme.of(context).copyWith(
            accentColor: DSColor.primaryGreen,
            dividerColor: Colors.transparent),
        child: ExpansionTile(
          title: Text(
            data.nday,
            style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w500,
                color: data.nholiday == 1 ? Colors.red : Colors.black),
          ),
          subtitle:
              Text(date, style: TextStyle(fontSize: 12, color: Colors.black)),
          children: <Widget>[
            SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  LabelValueWidget('Absen Masuk', formattedTimeMasuk),
                  LabelValueWidget('Absen Pulang', formattedTimePulang),
                ],
              ),
            ),
            SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  LabelValueWidget('Telat / Cepat',
                      data.hitJamMsk != null ? data.hitJamMsk.toString() : '-'),
                  LabelValueWidget('PSW / Lewat Waktu',
                      data.hitJamPlg != null ? data.hitJamPlg.toString() : '-'),
                ],
              ),
            ),
            SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  LabelValueWidget('Keterangan',
                      data.liburDesc != null ? data.liburDesc : '-'),
                  LabelValueWidget('', ''),
                ],
              ),
            ),
            SizedBox(height: 16)
          ],
        ),
      ),
    );
  }

  Widget buildAppBar(BuildContext context) {
    return AppBar(
      centerTitle: false,
      elevation: 1,
      titleSpacing: 0,
      title: appBarTitle,
      backgroundColor: Colors.white,
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
    );
  }
}
