import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:indonesia/indonesia.dart';
import 'package:intl/intl.dart';
import 'package:kemenag_go_internal_app/asn/feature/absensi/data/model/absensi_today_model.dart';
import 'package:kemenag_go_internal_app/asn/feature/absensi/domain/repo/absensi_repo.dart';
import 'package:kemenag_go_internal_app/asn/feature/absensi/presentation/bloc/absensi/bloc.dart';
import 'package:kemenag_go_internal_app/asn/feature/absensi/presentation/widget/card_menu_widget.dart';
import 'package:kemenag_go_internal_app/asn/feature/absensi/data/model/argument_absen_model.dart';
import 'package:kemenag_go_internal_app/core/design_system/colors.dart';
import 'package:kemenag_go_internal_app/core/function/setup_locator.dart';
import 'package:kemenag_go_internal_app/core/resources/routes.dart';
import 'package:kemenag_go_internal_app/core/util/custom_loader.dart';

class AbsensiScreen extends StatefulWidget {
  @override
  _AbsensiScreenState createState() => _AbsensiScreenState();
}

class _AbsensiScreenState extends State<AbsensiScreen> {
  Position _currentPosition;
  String dateNow = '';
  Widget appBarTitle = Text(
    'Absensi',
    style: TextStyle(color: Colors.black, fontSize: 16),
  );
  AbsensiBloc absensiBloc = AbsensiBloc(absensiRepository: AbsensiRepository());
  final GlobalKey<State> _keyLoader = GlobalKey<State>();

  @override
  void initState() {
    setState(() {
      DateTime date = DateTime.now();
      dateNow = tanggal(date);
    });
    absensiBloc.add(GetAbsensiToday());
    _getCurrentLocation();
    super.initState();
  }

  @override
  void dispose() {
    absensiBloc.close();
    super.dispose();
  }

  _getCurrentLocation() {
    Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.best,
            forceAndroidLocationManager: true)
        .then((Position position) {
      setState(() {
        _currentPosition = position;
      });
      print(_currentPosition.latitude);
      print(_currentPosition.longitude);
    }).catchError((e) {
      print(e);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.43,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      elevation: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Jadwal Mulai Kerja',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 12),
                            ),
                            Text(
                              '08:00',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.43,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      elevation: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Jadwal Selesai Kerja',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 12),
                            ),
                            Text(
                              '17:00',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 16),
              CardMenuAbsensiWidget(
                image: Image.asset(
                  'assets/images/infostaker.png',
                  width: 22,
                ),
                onTap: () {
                  Navigator.pushNamed(context, doAbsenROute,
                      arguments: ArgumentAbsenModel(
                          'WFO',
                          _currentPosition.latitude.toString(),
                          _currentPosition.longitude.toString()));
                },
                title: 'Kerja Di Kantor',
                subTitle:
                    'Pilih opsi ini untuk absensi jika anda bekerja di kantor',
              ),
              SizedBox(height: 16),
              CardMenuAbsensiWidget(
                image: Image.asset(
                  'assets/images/school.png',
                  width: 22,
                ),
                onTap: () {
                  Navigator.pushNamed(context, doAbsenROute,
                      arguments: ArgumentAbsenModel(
                          'WFH',
                          _currentPosition.latitude.toString(),
                          _currentPosition.longitude.toString()));
                },
                title: 'Kerja Dari Rumah',
                subTitle:
                    'Pilih opsi ini untuk absensi jika anda bekerja dari rumah',
              ),
              SizedBox(height: 16),
              Container(
                width: double.infinity,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  elevation: 2,
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Absensi Hari Ini',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 16),
                        BlocListener<AbsensiBloc, AbsensiState>(
                            cubit: absensiBloc,
                            listener: (_, AbsensiState state) {
                              if (state is AbsensiLoading) {
                                LoaderDialogs.showLoadingDialog(
                                    context, _keyLoader);
                              }
                              if (state is AbsensiTodayLoaded) {
                                Navigator.of(_keyLoader.currentContext,
                                        rootNavigator: true)
                                    .pop();
                              }
                              if (state is AbsensiTodayError) {
                                Navigator.of(_keyLoader.currentContext,
                                        rootNavigator: true)
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
                                  if (state is AbsensiTodayLoaded) {
                                    return _absenHariIni(
                                        state.absensiTodayModel);
                                  }
                                  if (state is AbsensiTodayError) {
                                    return Container();
                                  }
                                  return Container();
                                })),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
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
      actions: [
        Center(
          child: InkWell(
            onTap: () {
              Navigator.pushNamed(context, logAbsenRoute);
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Text('Log Absen',
                  style: TextStyle(fontSize: 11, color: DSColor.primaryGreen)),
            ),
          ),
        )
      ],
    );
  }

  Widget _absenHariIni(AbsensiTodayModel absensiTodayModel) {
    String date;
    String datePulang;
    DateTime tempDate;
    DateTime tempDatePulang;
    String formattedTime;
    String formattedTimePulang;
    if (absensiTodayModel.data.masuk != null) {
      date = absensiTodayModel.data.masuk;
      tempDate = DateFormat('yyyy-MM-dd HH:mm:ss').parse(date);
      formattedTime = DateFormat('HH:mm').format(tempDate);
    } else {
      formattedTime = '-';
    }
    if (absensiTodayModel.data.keluar != null) {
      datePulang = absensiTodayModel.data.keluar;
      tempDatePulang = DateFormat('yyyy-MM-dd HH:mm:ss').parse(datePulang);
      formattedTimePulang = DateFormat('HH:mm').format(tempDatePulang);
    } else {
      formattedTimePulang = '-';
    }
    return Container(
      color: Color(0xFFF5F5F5),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.calendar_today,
                  size: 14,
                ),
                SizedBox(width: 4),
                Text(
                  dateNow,
                  style: TextStyle(color: Colors.black, fontSize: 12),
                ),
              ],
            ),
            SizedBox(height: 16),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Absen Masuk',
                      style: TextStyle(color: Colors.black, fontSize: 12),
                    ),
                    Text(
                      'Kerja Dari Kantor',
                      style: TextStyle(color: Colors.grey, fontSize: 9),
                    ),
                  ],
                ),
                Text(
                  '$formattedTime WIB',
                  style: TextStyle(color: Colors.grey, fontSize: 9),
                ),
              ],
            ),
            SizedBox(height: 16),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Absen Pulang',
                      style: TextStyle(color: Colors.black, fontSize: 12),
                    ),
                    Text(
                      'Kerja Dari Kantor',
                      style: TextStyle(color: Colors.grey, fontSize: 9),
                    ),
                  ],
                ),
                Text(
                  '$formattedTimePulang WIB',
                  style: TextStyle(color: Colors.grey, fontSize: 9),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
