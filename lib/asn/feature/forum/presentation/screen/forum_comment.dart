import 'dart:core';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kemenag_go_internal_app/asn/feature/forum/domain/repo/forum_repo.dart';
import 'package:kemenag_go_internal_app/asn/feature/forum/domain/repo/upload_repo.dart';
import 'package:kemenag_go_internal_app/asn/feature/forum/presentation/bloc/forum/bloc.dart';
import 'package:kemenag_go_internal_app/asn/feature/forum/presentation/bloc/upload_file/bloc.dart';
import 'package:kemenag_go_internal_app/core/design_system/colors.dart';
import 'package:kemenag_go_internal_app/core/util/custom_loader.dart';
import 'package:file_picker/file_picker.dart';
import 'package:kemenag_go_internal_app/core/util/custom_toast.dart';
import 'package:oktoast/oktoast.dart';

class ForumCommentScreen extends StatefulWidget {
  final String id;

  const ForumCommentScreen(this.id);

  @override
  _ForumCommentScreenState createState() => _ForumCommentScreenState();
}

class _ForumCommentScreenState extends State<ForumCommentScreen> {
  Widget appBarTitle = Text(
    'Add Comment',
    style: TextStyle(color: Colors.black, fontSize: 16),
  );
  TextEditingController komentarController = TextEditingController();
  ForumBloc forumBloc = ForumBloc(forumRepository: ForumRepository());
  final GlobalKey<State> _keyLoader = GlobalKey<State>();
  String path = '', fileName = '', url = '';
  bool isUpload = false;
  UploadFileBloc uploadFileBloc =
      UploadFileBloc(uploadRepository: UploadRepository());

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    forumBloc.close();
    uploadFileBloc.close();
  }

  Future getPdfAndUpload() async {
    FilePickerResult result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'pdf', 'doc'],
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
      appBar: buildAppBar(context),
      body: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: BlocListener<ForumBloc, ForumState>(
              cubit: forumBloc,
              listener: (_, ForumState state) {
                if (state is ForumLoading) {
                  LoaderDialogs.showLoadingDialog(context, _keyLoader);
                }
                if (state is AddCommentLoaded) {
                  Navigator.of(_keyLoader.currentContext, rootNavigator: true)
                      .pop();
                  Navigator.pop(context, true);
                }
                if (state is ForumError) {
                  Navigator.of(_keyLoader.currentContext, rootNavigator: true)
                      .pop();
                }
              },
              child: BlocBuilder<ForumBloc, ForumState>(
                  cubit: forumBloc,
                  builder: (_, ForumState state) {
                    if (state is ForumInitial) {
                      return _mainConent();
                    }
                    if (state is ForumLoading) {
                      return _mainConent();
                    }
                    if (state is AddCommentLoaded) {
                      return _mainConent();
                    }
                    if (state is ForumError) {
                      return _mainConent();
                    }
                    return _mainConent();
                  }))),
    );
  }

  Widget _mainConent() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Upload File', style: TextStyle(fontSize: 14)),
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
            Container(
              padding: const EdgeInsets.only(left: 16.0, right: 16.0),
              decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
              child: TextFormField(
                maxLines: null,
                controller: komentarController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  labelText: "Tulis Komentar Anda",
                  hintText: "Tulis Komentar Anda",
                ),
              ),
            ),
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
                    forumBloc.add(AddCommentForum(widget.id,
                        komentarController.text.toString(), fileName, url));
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
}
