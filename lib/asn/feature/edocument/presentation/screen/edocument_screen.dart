import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kemenag_go_internal_app/asn/feature/edocument/data/model/data_model.dart';
import 'package:kemenag_go_internal_app/asn/feature/edocument/data/model/filter_model.dart';
import 'package:kemenag_go_internal_app/asn/feature/edocument/data/model/get_document_model.dart';
import 'package:kemenag_go_internal_app/asn/feature/edocument/domain/repo/document_repo.dart';
import 'package:kemenag_go_internal_app/asn/feature/edocument/presentation/bloc/document/bloc.dart';
import 'package:kemenag_go_internal_app/core/design_system/colors.dart';
import 'package:kemenag_go_internal_app/core/resources/routes.dart';
import 'package:kemenag_go_internal_app/core/util/custom_loader.dart';
import 'package:kemenag_go_internal_app/core/util/custom_toast.dart';
import 'package:oktoast/oktoast.dart';

class EdocumentScreen extends StatefulWidget {
  @override
  _EdocumentScreenState createState() => _EdocumentScreenState();
}

class _EdocumentScreenState extends State<EdocumentScreen>
    with TickerProviderStateMixin {
  List<FilterModel> _filterModel = FilterModel.getFilter();
  List<DropdownMenuItem<FilterModel>> _dropdownMenuItems;
  FilterModel _selectedCompany;
  List<DataModel> _dataModel = [];
  bool viewMode = false;
  AnimationController _animationController;
  Animation<double> _animation;
  DocumentBloc documentBloc =
      DocumentBloc(documentRepository: DocumentRepository());
  final GlobalKey<State> _keyLoader = GlobalKey<State>();

  @override
  void initState() {
    documentBloc.add(GetDocument());
    _animationController = AnimationController(
        duration: const Duration(milliseconds: 500),
        vsync: this,
        value: 0,
        lowerBound: 0,
        upperBound: 1);
    _animation =
        CurvedAnimation(parent: _animationController, curve: Curves.easeOut);
    _animationController.forward();
    _dropdownMenuItems = buildDropdownMenuItems(_filterModel);
    _selectedCompany = _dropdownMenuItems[0].value;
    _dataModel.add(
        DataModel(title: 'E-Learning web design', items: '12', type: 'folder'));
    _dataModel.add(DataModel(
        title: 'Online shop web design', items: '22', type: 'folder'));
    _dataModel.add(
        DataModel(title: 'Analitical dashboard', items: '40', type: 'folder'));
    _dataModel.add(
        DataModel(title: 'Creative landing page', items: '6', type: 'folder'));
    _dataModel.add(
        DataModel(title: 'Creative landing page', items: 'PDF', type: 'file'));
    _dataModel.add(
        DataModel(title: 'Creative landing page', items: 'DOCX', type: 'file'));
    super.initState();
  }

  @override
  void dispose() {
    documentBloc.close();
    super.dispose();
  }

  List<DropdownMenuItem<FilterModel>> buildDropdownMenuItems(List companies) {
    List<DropdownMenuItem<FilterModel>> items = List();
    for (FilterModel company in companies) {
      items.add(
        DropdownMenuItem(
          value: company,
          child: Text(company.name),
        ),
      );
    }
    return items;
  }

  onChangeDropdownItem(FilterModel selectedCompany) {
    setState(() {
      _selectedCompany = selectedCompany;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: buildAppBar(context),
        floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.add,
            size: 32,
          ),
          backgroundColor: DSColor.primaryGreen,
          onPressed: () async {
            final Object _args = await Navigator.pushNamed(
              context,
              uploadDocumentRoute,
            );

            if (_args) {
              showToastWidget(
                  const CustomToast(
                    message: 'Document berhasil ditambahkan.',
                    backgroundColor: DSColor.primaryGreen,
                    isSuccess: true,
                  ),
                  position: ToastPosition.top,
                  duration: const Duration(seconds: 5));
              documentBloc.add(GetDocument());
            }
          },
        ),
        body: BlocListener<DocumentBloc, DocumentState>(
            cubit: documentBloc,
            listener: (_, DocumentState state) {
              if (state is DocumentLoading) {
                LoaderDialogs.showLoadingDialog(context, _keyLoader);
              }
              if (state is DocumentGetLoaded) {
                Navigator.of(_keyLoader.currentContext, rootNavigator: true)
                    .pop();
              }
              if (state is DocumentError) {
                Navigator.of(_keyLoader.currentContext, rootNavigator: true)
                    .pop();
                if (state.error == 'expired') {
                  Navigator.pushNamed(context, loginRoute);
                }
              }
            },
            child: BlocBuilder<DocumentBloc, DocumentState>(
                cubit: documentBloc,
                builder: (_, DocumentState state) {
                  if (state is DocumentInitial) {
                    return Container();
                  }
                  if (state is DocumentLoading) {
                    return Container();
                  }
                  if (state is DocumentGetLoaded) {
                    return _mainContent(state.getDocumentModel);
                  }
                  if (state is DocumentError) {
                    return Container();
                  }
                  return Container();
                })));
  }

  Widget _mainContent(GetDocumentModel getDocumentModel) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DropdownButton(
                  underline: Container(),
                  icon: Icon(Icons.keyboard_arrow_down_rounded),
                  iconSize: 20.0,
                  value: _selectedCompany,
                  items: _dropdownMenuItems,
                  onChanged: onChangeDropdownItem,
                ),
                !viewMode
                    ? InkWell(
                        onTap: () {
                          setState(() {
                            viewMode = true;
                          });
                        },
                        child: Icon(Icons.grid_view))
                    : InkWell(
                        onTap: () {
                          setState(() {
                            viewMode = false;
                          });
                        },
                        child: Icon(Icons.list))
              ],
            ),
          ),
          SizedBox(height: 16),
          AnimatedSwitcher(
              duration: Duration(milliseconds: 200),
              child: !viewMode
                  ? _listView(getDocumentModel)
                  : _gridView(getDocumentModel))
        ],
      ),
    );
  }

  Widget _gridView(GetDocumentModel getDocumentModel) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0),
      child: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: (2 / 1.6),
        crossAxisSpacing: 16.0,
        mainAxisSpacing: 16.0,
        shrinkWrap: true,
        children: getDocumentModel.data
            .map((data) => Card(
                  color: Color(0xFFF5F5F5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          data.group != ''
                              ? Image.asset('assets/images/folder_icon.png',
                                  height: 40)
                              : Image.asset('assets/images/file_icon.png',
                                  height: 40),
                          SizedBox(height: 8),
                          Text(data.fileName,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: 16.0, fontWeight: FontWeight.bold)),
                          SizedBox(height: 8),
                          data.group != ''
                              ? Text('0 items',
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    color: Colors.grey,
                                  ))
                              : Text('-',
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    color: Colors.grey,
                                  ))
                        ],
                      ),
                    ),
                  ),
                ))
            .toList(),
      ),
    );
  }

  Widget _listView(GetDocumentModel getDocumentModel) {
    return ListView.separated(
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(height: 16);
        },
        itemCount: getDocumentModel.data.length,
        scrollDirection: Axis.vertical,
        physics: ScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return ListTile(
            leading: getDocumentModel.data[index].group != ''
                ? Image.asset('assets/images/folder_icon.png', height: 63)
                : Image.asset('assets/images/file_icon.png', height: 63),
            title: Text(getDocumentModel.data[index].fileName,
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)),
            subtitle: getDocumentModel.data[index].group != ''
                ? Text('0 items',
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.grey,
                    ))
                : Text('-',
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.grey,
                    )),
          );
        });
  }

  Widget buildAppBar(BuildContext context) {
    return AppBar(
      centerTitle: false,
      elevation: 0,
      titleSpacing: 0,
      title: Text(
        'E-Document',
        style: TextStyle(color: Colors.black, fontSize: 16),
      ),
      backgroundColor: Colors.white,
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
    );
  }
}
