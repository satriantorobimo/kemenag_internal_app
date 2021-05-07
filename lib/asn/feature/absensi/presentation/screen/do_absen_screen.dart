import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:kemenag_go_internal_app/asn/feature/absensi/domain/repo/absensi_repo.dart';
import 'package:kemenag_go_internal_app/asn/feature/absensi/presentation/bloc/absensi/bloc.dart';
import 'package:kemenag_go_internal_app/asn/feature/absensi/data/model/argument_absen_model.dart';
import 'package:kemenag_go_internal_app/core/design_system/colors.dart';
import 'package:kemenag_go_internal_app/core/resources/routes.dart';
import 'package:kemenag_go_internal_app/core/util/custom_loader.dart';

class DoAbsenScreen extends StatefulWidget {
  final ArgumentAbsenModel argumentAbsenModel;
  DoAbsenScreen(this.argumentAbsenModel);
  @override
  _DoAbsenScreenState createState() => _DoAbsenScreenState();
}

class _DoAbsenScreenState extends State<DoAbsenScreen> {
  bool isMasuk = false;
  bool isPulang = false;
  String message = '';
  final GlobalKey<State> _keyLoader = GlobalKey<State>();
  AbsensiBloc absensiBloc = AbsensiBloc(absensiRepository: AbsensiRepository());
  Widget appBarTitle = Text(
    'Absensi',
    style: TextStyle(color: Colors.black, fontSize: 16),
  );
  @override
  void initState() {
    print('lalalalala');
    DateFormat dateFormat = DateFormat.Hm();

    DateTime now = DateTime.now();
    DateTime close = dateFormat.parse("12:00:01");
    close = DateTime(now.year, now.month, now.day, close.hour, close.minute);
    String a = close.difference(now).toString();
    if (a[0] == '-') {
      setState(() {
        isMasuk = false;
        isPulang = true;
      });
    } else {
      setState(() {
        isMasuk = true;
        isPulang = false;
      });
    }
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
              if (state is AbsensiLoaded) {
                Navigator.of(_keyLoader.currentContext, rootNavigator: true)
                    .pop();
                Navigator.pushNamed(context, successAbsenRoute,
                    arguments: state.absensiModel.data.message);
              }
              if (state is AbsensiError) {
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
                    return _mainContent();
                  }
                  if (state is AbsensiLoading) {
                    return _mainContent();
                  }
                  if (state is AbsensiLoaded) {
                    return _mainContent();
                  }
                  if (state is AbsensiError) {
                    return _mainContent();
                  }
                  return _mainContent();
                })));
  }

  Widget _mainContent() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
          child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
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
                  SizedBox(height: 24),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.43,
                    height: 45,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                      onPressed: isMasuk
                          ? () {
                              absensiBloc.add(
                                  AttemptAbsensi(widget.argumentAbsenModel));
                            }
                          : null,
                      padding: EdgeInsets.all(12),
                      color: DSColor.primaryGreen,
                      child:
                          Text('Masuk', style: TextStyle(color: Colors.white)),
                    ),
                  ),
                ],
              ),
              Column(
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
                  ),
                  SizedBox(height: 24),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.43,
                    height: 45,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                      onPressed: isPulang
                          ? () {
                              absensiBloc.add(
                                  AttemptAbsensi(widget.argumentAbsenModel));
                            }
                          : null,
                      padding: EdgeInsets.all(12),
                      color: DSColor.primaryGreen,
                      child:
                          Text('Pulang', style: TextStyle(color: Colors.white)),
                    ),
                  ),
                ],
              )
            ],
          ),
        ],
      )),
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
