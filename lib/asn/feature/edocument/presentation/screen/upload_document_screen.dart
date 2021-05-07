import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kemenag_go_internal_app/asn/feature/edocument/data/model/add_document_data_model.dart';
import 'package:kemenag_go_internal_app/asn/feature/edocument/domain/repo/document_repo.dart';
import 'package:kemenag_go_internal_app/asn/feature/edocument/presentation/bloc/document/bloc.dart';
import 'package:kemenag_go_internal_app/asn/feature/forum/domain/repo/upload_repo.dart';
import 'package:kemenag_go_internal_app/asn/feature/forum/presentation/bloc/upload_file/bloc.dart';
import 'package:kemenag_go_internal_app/core/design_system/colors.dart';
import 'package:kemenag_go_internal_app/core/resources/routes.dart';
import 'package:kemenag_go_internal_app/core/util/custom_loader.dart';
import 'package:kemenag_go_internal_app/core/util/custom_toast.dart';
import 'package:oktoast/oktoast.dart';

class UploadDocumentScreen extends StatefulWidget {
  @override
  _UploadDocumentScreenState createState() => _UploadDocumentScreenState();
}

class _UploadDocumentScreenState extends State<UploadDocumentScreen> {
  TextEditingController _namaFileController = TextEditingController();
  TextEditingController _dirController = TextEditingController();
  TextEditingController _keteranganController = TextEditingController();
  UploadFileBloc uploadFileBloc =
      UploadFileBloc(uploadRepository: UploadRepository());
  DocumentBloc documentBloc =
      DocumentBloc(documentRepository: DocumentRepository());
  final GlobalKey<State> _keyLoader = GlobalKey<State>();
  String path = '', fileName = '', url = '';
  bool isUpload = false;

  @override
  void dispose() {
    uploadFileBloc.close();
    documentBloc.close();
    super.dispose();
  }

  Future getPdfAndUpload() async {
    FilePickerResult result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: [
        'jpg',
        'pdf',
        'doc',
        'docx',
        'xls',
        'xlsx',
        'jpg',
        'jpeg',
        'png',
        'zip',
        'rar'
      ],
    );

    if (result != null) {
      PlatformFile file = result.files.first;

      print(file.name);
      print(file.bytes);
      print(file.size);
      print(file.extension);
      print(file.path);
      setState(() {
        path = file.path;
      });
      uploadFileBloc.add(UploadFile(file.path));
    } else {
      // User canceled the picker
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: buildAppBar(context),
        body: BlocListener<DocumentBloc, DocumentState>(
            cubit: documentBloc,
            listener: (_, DocumentState state) {
              if (state is DocumentLoading) {
                LoaderDialogs.showLoadingDialog(context, _keyLoader);
              }
              if (state is DocumentAddLoaded) {
                Navigator.of(_keyLoader.currentContext, rootNavigator: true)
                    .pop();
                Navigator.pop(context, true);
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
                    return _mainContent();
                  }
                  if (state is DocumentLoading) {
                    return _mainContent();
                  }
                  if (state is DocumentAddLoaded) {
                    return _mainContent();
                  }
                  if (state is DocumentError) {
                    return _mainContent();
                  }
                  return _mainContent();
                })));
  }

  Widget _mainContent() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(left: 16.0, right: 16.0),
              decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
              child: TextFormField(
                textInputAction: TextInputAction.done,
                controller: _namaFileController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  labelText: "Nama Document",
                ),
              ),
            ),
            SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.only(left: 16.0, right: 16.0),
              decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
              child: TextFormField(
                controller: _dirController,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  labelText: "Directory",
                ),
              ),
            ),
            SizedBox(height: 4),
            Text(
              'Kosongkan jika Anda tidak ingin membuat direktori',
              style: TextStyle(color: Colors.grey, fontSize: 11),
            ),
            SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.only(left: 16.0, right: 16.0),
              decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
              child: TextFormField(
                maxLines: null,
                controller: _keteranganController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  labelText: "Tulis Keterangan Dokumen",
                ),
              ),
            ),
            SizedBox(height: 16),
            Text('Upload File', style: TextStyle(fontSize: 14)),
            SizedBox(height: 8),
            Text(
                'Dokumen yang dapat di upload hanya file/dokumen yang memiliki ekstensi *.doc, *.docx, *.xls, *.xlsx, *.pdf, *.jpg, *.jpeg, *.png, *.zip atau *.rar. Maksimal ukuran 5MB',
                style: TextStyle(fontSize: 11)),
            SizedBox(height: 16),
            BlocListener<UploadFileBloc, UploadFileState>(
                cubit: uploadFileBloc,
                listener: (_, UploadFileState state) {
                  if (state is UploadFileLoading) {
                    LoaderDialogs.showLoadingDialog(context, _keyLoader);
                  }
                  if (state is UploadFileLoaded) {
                    Navigator.of(_keyLoader.currentContext, rootNavigator: true)
                        .pop();
                    showToastWidget(
                        const CustomToast(
                          message: 'File telah terunggah.',
                          backgroundColor: DSColor.primaryGreen,
                          isSuccess: true,
                        ),
                        position: ToastPosition.top,
                        duration: const Duration(seconds: 5));
                    setState(() {
                      fileName =
                          state.uploadFileResponse.data.fileName ?? 'aaaa';
                      url = state.uploadFileResponse.data.fileUrl ?? 'bbbb';
                      isUpload = true;
                    });
                  }
                  if (state is UploadFileError) {
                    Navigator.of(_keyLoader.currentContext, rootNavigator: true)
                        .pop();
                    if (state.error == 'expired') {
                      Navigator.pushNamed(context, loginRoute);
                    } else
                      showToastWidget(
                          CustomToast(
                            message: state.error,
                            backgroundColor: Colors.red,
                            isSuccess: false,
                          ),
                          position: ToastPosition.top,
                          duration: const Duration(seconds: 5));
                  }
                },
                child: BlocBuilder<UploadFileBloc, UploadFileState>(
                    cubit: uploadFileBloc,
                    builder: (_, UploadFileState state) {
                      if (state is UploadFileInitial) {
                        return _buttonFileName();
                      }
                      if (state is UploadFileLoading) {
                        return _buttonFileName();
                      }
                      if (state is UploadFileLoaded) {
                        return _buttonFileName();
                      }
                      if (state is UploadFileError) {
                        return _buttonFileName();
                      }
                      return _buttonFileName();
                    })),
            Visibility(
              child: SizedBox(height: 24),
              visible: isUpload,
            ),
            Visibility(
                child: Container(
                  width: double.infinity,
                  color: Colors.grey[200],
                  padding: EdgeInsets.all(8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.picture_as_pdf_rounded,
                              color: Colors.grey, size: 12),
                          SizedBox(width: 4),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.6,
                            child: Text(
                              fileName,
                              style:
                                  TextStyle(fontSize: 12.0, color: Colors.grey),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      Text('Hapus',
                          style: TextStyle(
                              fontSize: 12.0,
                              color: Colors.red,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                visible: isUpload),
            SizedBox(height: 24),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Container(
                width: double.infinity,
                height: 45,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  onPressed: () {
                    documentBloc.add(AddDocument(AddDocumentData(
                        _namaFileController.text.toString(),
                        url,
                        _keteranganController.text.toString(),
                        _dirController.text.toString())));
                  },
                  padding: EdgeInsets.all(12),
                  color: DSColor.primaryGreen,
                  child: Text('Submit', style: TextStyle(color: Colors.white)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buttonFileName() {
    return InkWell(
      onTap: () {
        getPdfAndUpload();
      },
      child: Container(
          width: 100,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
          child: Center(
            child: Row(
              children: [
                Icon(
                  Icons.upload_outlined,
                  size: 20,
                  color: Colors.black,
                ),
                SizedBox(width: 4),
                Text(
                  'Pilih file',
                  style: TextStyle(color: Colors.black, fontSize: 14),
                )
              ],
            ),
          )),
    );
  }

  Widget buildAppBar(BuildContext context) {
    return AppBar(
      leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context, false);
          }),
      centerTitle: false,
      elevation: 0,
      titleSpacing: 0,
      title: Text(
        'Add Document',
        style: TextStyle(color: Colors.black, fontSize: 16),
      ),
      backgroundColor: Colors.white,
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
    );
  }
}
