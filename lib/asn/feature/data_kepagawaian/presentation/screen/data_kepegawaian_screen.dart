import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kemenag_go_internal_app/asn/feature/data_kepagawaian/data/data_kepegawaian_model.dart';
import 'package:kemenag_go_internal_app/asn/feature/data_kepagawaian/domain/repo/data_kepegawaian_repo.dart';
import 'package:kemenag_go_internal_app/asn/feature/data_kepagawaian/presentation/bloc/data_kepegawaian/bloc.dart';
import 'package:kemenag_go_internal_app/asn/feature/meeting/presentation/widget/card_menu_widget.dart';
import 'package:kemenag_go_internal_app/core/resources/routes.dart';
import 'package:kemenag_go_internal_app/core/util/custom_loader.dart';

class DataKepegawaianScreen extends StatefulWidget {
  DataKepegawaianScreen({Key key}) : super(key: key);

  @override
  _DataKepegawaianScreenState createState() => _DataKepegawaianScreenState();
}

class _DataKepegawaianScreenState extends State<DataKepegawaianScreen> {
  DataKepegawaianBloc dataKepegawaianBloc = DataKepegawaianBloc(
      dataKepegawaianRepository: DataKepegawaianRepository());
  final GlobalKey<State> _keyLoader = GlobalKey<State>();
  Widget appBarTitle = Text(
    'Data Kepegawaian',
    style: TextStyle(color: Colors.black, fontSize: 16),
  );

  List<String> _listCard = [
    'Data Utama',
    "Riwayat Pendidikan",
    "Riwayat Jabatan",
    "Riwayat Golongan / KP"
  ];

  @override
  void initState() {
    dataKepegawaianBloc.add(GetDataKepegawaian());
    super.initState();
  }

  @override
  void dispose() {
    dataKepegawaianBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: buildAppBar(context),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: BlocListener<DataKepegawaianBloc, DataKepegawaianState>(
            cubit: dataKepegawaianBloc,
            listener: (_, DataKepegawaianState state) {
              if (state is DataKepegawaianLoading) {
                LoaderDialogs.showLoadingDialog(context, _keyLoader);
              }
              if (state is DataKepegawaianLoaded) {
                Navigator.of(_keyLoader.currentContext, rootNavigator: true)
                    .pop();
              }
              if (state is DataKepegawaianError) {
                Navigator.of(_keyLoader.currentContext, rootNavigator: true)
                    .pop();
                if (state.error == 'expired') {
                  print('expired');
                  Navigator.pushNamed(context, loginRoute);
                }
              }
            },
            child: BlocBuilder<DataKepegawaianBloc, DataKepegawaianState>(
                cubit: dataKepegawaianBloc,
                builder: (_, DataKepegawaianState state) {
                  if (state is DataKepegawaianInitial) {
                    return Container();
                  }
                  if (state is DataKepegawaianLoading) {
                    return Container();
                  }
                  if (state is DataKepegawaianLoaded) {
                    return _mainContent(state.dataKepegawaianModel);
                  }
                  if (state is DataKepegawaianError) {
                    return Container();
                  }
                  return Container();
                }),
          ),
        ));
  }

  Widget buildAppBar(BuildContext context) {
    return AppBar(
      centerTitle: false,
      elevation: 0,
      titleSpacing: 0,
      title: appBarTitle,
      backgroundColor: Colors.white,
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
    );
  }

  Widget _mainContent(DataKepegawaianModel dataKepegawaianModel) {
    return ListView.separated(
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(height: 16);
        },
        itemCount: dataKepegawaianModel.data.data.length,
        scrollDirection: Axis.vertical,
        physics: ScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) => CardMenuWidget(
              image: Image.asset(
                'assets/images/user-white.png',
                width: 22,
              ),
              onTap: () {
                if (dataKepegawaianModel.data.data[index].label ==
                    'Data Utama') {
                  Navigator.pushNamed(context, dataUtamaRoute,
                      arguments: dataKepegawaianModel.data.data[index]);
                } else if (dataKepegawaianModel.data.data[index].label ==
                    'Riwayat Pendidikan') {
                  Navigator.pushNamed(context, riwayatPendidikanRoute,
                      arguments: dataKepegawaianModel.data.data[index]);
                } else if (dataKepegawaianModel.data.data[index].label ==
                    'Riwayat Jabatan') {
                  Navigator.pushNamed(context, riwayatJabatanRoute,
                      arguments: dataKepegawaianModel.data.data[index]);
                } else {
                  Navigator.pushNamed(context, riwayatGolonganRoute,
                      arguments: dataKepegawaianModel.data.data[index]);
                }
              },
              title: dataKepegawaianModel.data.data[index].label,
            ));
  }
}
