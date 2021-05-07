import 'dart:io';
import 'dart:ui';
import 'package:dio/dio.dart';
import 'package:kemenag_go_internal_app/asn/feature/forum/presentation/bloc/comment_forum/bloc.dart';
import 'package:kemenag_go_internal_app/core/util/custom_toast.dart';
import 'package:oktoast/oktoast.dart';
import 'package:path_provider/path_provider.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:intl/intl.dart';
import 'package:kemenag_go_internal_app/asn/feature/forum/data/forum_detail_model.dart';
import 'package:kemenag_go_internal_app/asn/feature/forum/data/comment_forum_model.dart'
    as CommentForum;
import 'package:kemenag_go_internal_app/asn/feature/forum/data/list_forum_model.dart'
    as ForumList;
import 'package:kemenag_go_internal_app/asn/feature/forum/domain/repo/forum_repo.dart';
import 'package:kemenag_go_internal_app/asn/feature/forum/presentation/bloc/forum/bloc.dart';
import 'package:kemenag_go_internal_app/core/design_system/colors.dart';
import 'package:kemenag_go_internal_app/core/resources/routes.dart';
import 'package:kemenag_go_internal_app/core/util/custom_loader.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:file_utils/file_utils.dart';

class ForumDetailScreen extends StatefulWidget {
  final ForumList.Datas datas;
  ForumDetailScreen(this.datas);

  @override
  _ForumDetailScreenState createState() => _ForumDetailScreenState();
}

class _ForumDetailScreenState extends State<ForumDetailScreen> {
  ForumBloc forumBloc = ForumBloc(forumRepository: ForumRepository());
  CommentForumBloc commentForumBloc =
      CommentForumBloc(forumRepository: ForumRepository());
  bool isComment = false;
  final GlobalKey<State> _keyLoader = GlobalKey<State>();
  ScrollController _scrollController = ScrollController();
  bool downloading = false;
  var progress = "";
  var path = "No Data";
  var platformVersion = "Unknown";
  Directory externalDir;
  int page = 1, id = 0;
  bool isLoading = false;

  @override
  void initState() {
    forumBloc.add(GetDetailForum(widget.datas.id.toString()));
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    forumBloc.close();
    commentForumBloc.close();
  }

  Future<bool> _requestPermission(Permission permission) async {
    if (await permission.isGranted) {
      return true;
    } else {
      final result = await permission.request();
      if (result == PermissionStatus.granted) {
        return true;
      }
    }
    return false;
  }

  Future<void> downloadFile(String url, String fileName) async {
    Dio dio = Dio();
    try {
      if (Platform.isAndroid) {
        if (await _requestPermission(Permission.storage)) {
          String dirloc = "";
          if (Platform.isAndroid) {
            dirloc = "/sdcard/download/";
          } else {
            dirloc = (await getApplicationDocumentsDirectory()).path;
          }

          try {
            FileUtils.mkdir([dirloc]);
            await dio.download(url, dirloc + fileName,
                onReceiveProgress: (receivedBytes, totalBytes) {
              setState(() {
                downloading = true;
                progress =
                    ((receivedBytes / totalBytes) * 100).toStringAsFixed(0) +
                        "%";
              });
            });
          } catch (e) {
            print(e);
          }

          setState(() {
            downloading = false;
            progress = "Download Completed.";
            path = dirloc + fileName;
          });
          Navigator.of(_keyLoader.currentContext, rootNavigator: true).pop();
          showToastWidget(
              const CustomToast(
                message: 'File telah terunduh.',
                backgroundColor: DSColor.primaryGreen,
                isSuccess: true,
              ),
              position: ToastPosition.top,
              duration: const Duration(seconds: 5));
        } else {
          showToastWidget(
              const CustomToast(
                message: 'File gagal terunduh.',
                backgroundColor: Colors.red,
                isSuccess: false,
              ),
              position: ToastPosition.top,
              duration: const Duration(seconds: 5));
        }
      } else {}
    } catch (e) {
      Navigator.of(_keyLoader.currentContext, rootNavigator: true).pop();
      showToastWidget(
          const CustomToast(
            message: 'File gagal terunduh.',
            backgroundColor: Colors.red,
            isSuccess: false,
          ),
          position: ToastPosition.top,
          duration: const Duration(seconds: 5));
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      floatingActionButton: FloatingActionButton(
        child: Image.asset(
          'assets/images/message.png',
          width: 24,
        ),
        backgroundColor: DSColor.primaryGreen,
        onPressed: () async {
          final Object _args = await Navigator.pushNamed(
              context, commentForumRoute,
              arguments: widget.datas.id.toString());

          if (_args) {
            setState(() {
              isComment = true;
            });
            commentForumBloc.add(GetComentForum(id, page));
          }
        },
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: BlocListener<ForumBloc, ForumState>(
            cubit: forumBloc,
            listener: (_, ForumState state) {
              if (state is ForumLoading) {
                LoaderDialogs.showLoadingDialog(context, _keyLoader);
              }
              if (state is ForumDetailLoaded) {
                Navigator.of(_keyLoader.currentContext, rootNavigator: true)
                    .pop();
                commentForumBloc
                    .add(GetComentForum(state.forumDetailModel.data.id, page));
                setState(() {
                  id = state.forumDetailModel.data.id;
                });
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
                    return Container();
                  }
                  if (state is ForumLoading) {
                    return Container();
                  }
                  if (state is ForumDetailLoaded) {
                    return _mainContent(state.forumDetailModel);
                    // return _skeletonLoading();
                  }
                  if (state is ForumError) {
                    return Container();
                  }
                  return Container();
                })),
      ),
    );
  }

  Widget _mainContent(ForumDetailModel forumDetailModel) {
    final String date = forumDetailModel.data.created_at;
    final DateTime tempDate = DateFormat('yyyy-MM-ddTHH:mm:ss').parse(date);
    final DateFormat serverFormater = DateFormat('dd/MM/yyyy HH:mm');
    final String formatted = serverFormater.format(tempDate);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.only(left: 24.0, right: 24.0, top: 24.0),
                child: Row(
                  children: [
                    Container(
                      width: 40.0,
                      height: 40.0,
                      decoration: BoxDecoration(
                        color: Color(0xFFF0F0F0),
                        image: DecorationImage(
                          image: NetworkImage(
                              'https://kubalubra.is/wp-content/uploads/2017/11/default-thumbnail.jpg'),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(50.0)),
                      ),
                    ),
                    SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(forumDetailModel.data.user.name,
                            style: TextStyle(
                                fontSize: 12.0, fontWeight: FontWeight.bold)),
                        SizedBox(height: 4),
                        Row(
                          children: [
                            Icon(Icons.calendar_today, size: 10),
                            SizedBox(width: 4),
                            Text(formatted,
                                style: TextStyle(
                                  fontSize: 10.0,
                                )),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.only(left: 24.0, right: 24.0),
                child: Text(forumDetailModel.data.title,
                    style:
                        TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold)),
              ),
              SizedBox(height: 6),
              Padding(
                padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                child: Html(
                    data: '''
                                        ${forumDetailModel.data.content}
                                        ''',
                    onLinkTap: (String url) async {
                      // if (await canLaunch(url)) {
                      //   await launch(url);
                      // } else {
                      //   throw 'Could not launch $url';
                      // }
                    }),
              ),
              SizedBox(height: 6),
              Padding(
                  padding: const EdgeInsets.only(left: 24.0, right: 24.0),
                  child: ListView.separated(
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(height: 8);
                    },
                    itemCount: forumDetailModel.data.forum_files.length,
                    scrollDirection: Axis.vertical,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) => Container(
                      width: double.infinity,
                      color: Colors.white,
                      padding: EdgeInsets.all(8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.picture_as_pdf_rounded,
                                  color: DSColor.primaryGreen, size: 12),
                              SizedBox(width: 4),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.6,
                                child: Text(
                                  forumDetailModel
                                      .data.forum_files[index].file_name,
                                  style: TextStyle(
                                      fontSize: 12.0,
                                      color: DSColor.primaryGreen),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                          InkWell(
                            onTap: () async {
                              if (Platform.isAndroid) {
                                LoaderDialogs.showLoadingDialog(
                                    context, _keyLoader);
                                downloadFile(
                                    forumDetailModel
                                        .data.forum_files[index].url,
                                    forumDetailModel
                                        .data.forum_files[index].file_name);
                              } else {
                                final status =
                                    await Permission.storage.request();

                                if (status.isGranted) {
                                  final externalDir =
                                      await getApplicationDocumentsDirectory();

                                  print(externalDir);

                                  final id = await FlutterDownloader.enqueue(
                                    url: forumDetailModel
                                        .data.forum_files[index].url,
                                    savedDir: externalDir.path,
                                    showNotification: true,
                                    openFileFromNotification: true,
                                  );
                                } else {
                                  print('Permission deined');
                                }
                              }
                            },
                            child: Text('Download',
                                style: TextStyle(
                                    fontSize: 12.0,
                                    color: DSColor.primaryGreen,
                                    fontWeight: FontWeight.bold)),
                          ),
                        ],
                      ),
                    ),
                  )),
              SizedBox(height: 16),
              BlocListener<CommentForumBloc, CommentForumState>(
                  cubit: commentForumBloc,
                  listener: (_, CommentForumState state) {
                    if (state is CommentForumLoading) {
                      print('State 1');
                      setState(() {
                        isLoading = true;
                      });
                    }
                    if (state is CommentForumLoaded) {
                      print('State 2');
                      setState(() {
                        isLoading = false;
                      });
                    }
                    if (state is CommentForumError) {
                      print('State 3');
                      setState(() {
                        isLoading = false;
                      });
                    }
                  },
                  child: BlocBuilder<CommentForumBloc, CommentForumState>(
                      cubit: commentForumBloc,
                      builder: (_, CommentForumState state) {
                        if (state is CommentForumInitial) {
                          return Container();
                        }
                        if (state is CommentForumLoading) {
                          return Container();
                        }
                        if (state is CommentForumLoaded) {
                          final List<CommentForum.Datas> datas =
                              state.forumDetailModel;

                          return _viewComment(datas, state.hasReachedMax);
                          // return _skeletonLoading();
                        }
                        if (state is CommentForumError) {
                          return Container();
                        }
                        return Container();
                      }))
            ],
          ),
        )
      ],
    );
  }

  Widget _viewComment(List<CommentForum.Datas> datas, bool hasReachedMax) {
    return Column(
      children: [
        ListView.separated(
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(height: 8);
            },
            itemCount: hasReachedMax ? datas.length : datas.length,
            scrollDirection: Axis.vertical,
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            reverse: true,
            itemBuilder: (context, index) {
              final String date = datas[index].created_at;
              final DateTime tempDate =
                  DateFormat('yyyy-MM-ddTHH:mm:ss').parse(date);
              final DateFormat serverFormater = DateFormat('dd/MM/yyyy HH:mm');
              final String formatted = serverFormater.format(tempDate);
              return Container(
                  width: double.infinity,
                  color: Colors.white,
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                        child: Row(
                          children: [
                            Container(
                              width: 40.0,
                              height: 40.0,
                              decoration: BoxDecoration(
                                color: Color(0xFFF0F0F0),
                                image: DecorationImage(
                                  image: NetworkImage(
                                      'https://kubalubra.is/wp-content/uploads/2017/11/default-thumbnail.jpg'),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50.0)),
                              ),
                            ),
                            SizedBox(width: 16),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(datas[index].user.name.toString() ?? '',
                                    style: TextStyle(
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.bold)),
                                SizedBox(height: 4),
                                Row(
                                  children: [
                                    Icon(Icons.calendar_today, size: 10),
                                    SizedBox(width: 4),
                                    Text(formatted,
                                        style: TextStyle(
                                          fontSize: 10.0,
                                        )),
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 24),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                        child: Text(datas[index].message.toString() ?? '',
                            style: TextStyle(
                              fontSize: 11.0,
                            )),
                      ),
                      datas[index].comment_files != null
                          ? SizedBox(height: 16)
                          : Container(),
                      datas[index].comment_files == null
                          ? Container()
                          : ListView.separated(
                              separatorBuilder:
                                  (BuildContext context, int index) {
                                return SizedBox(height: 8);
                              },
                              itemCount: datas[index].comment_files.length,
                              scrollDirection: Axis.vertical,
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder: (context, i) => Container(
                                width: double.infinity,
                                color: Colors.grey[200],
                                padding: EdgeInsets.all(8),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(Icons.picture_as_pdf_rounded,
                                            color: DSColor.primaryGreen,
                                            size: 12),
                                        SizedBox(width: 4),
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.6,
                                          child: Text(
                                            datas[index]
                                                .comment_files[i]
                                                .file_name,
                                            style: TextStyle(
                                                fontSize: 12.0,
                                                color: DSColor.primaryGreen),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ],
                                    ),
                                    InkWell(
                                      onTap: () async {
                                        if (Platform.isAndroid) {
                                          LoaderDialogs.showLoadingDialog(
                                              context, _keyLoader);
                                          downloadFile(
                                              datas[index].comment_files[i].url,
                                              datas[index]
                                                  .comment_files[i]
                                                  .file_name);
                                        } else {
                                          final status = await Permission
                                              .storage
                                              .request();

                                          if (status.isGranted) {
                                            final externalDir =
                                                await getApplicationDocumentsDirectory();

                                            print(externalDir);

                                            final id =
                                                await FlutterDownloader.enqueue(
                                              url: datas[index]
                                                  .comment_files[i]
                                                  .url,
                                              savedDir: externalDir.path,
                                              showNotification: true,
                                              openFileFromNotification: true,
                                            );
                                          } else {
                                            print('Permission deined');
                                          }
                                        }
                                      },
                                      child: Text('Download',
                                          style: TextStyle(
                                              fontSize: 12.0,
                                              color: DSColor.primaryGreen,
                                              fontWeight: FontWeight.bold)),
                                    ),
                                  ],
                                ),
                              ),
                            )
                    ],
                  ));
            }),
        const SizedBox(
          height: 16,
        ),
        if (hasReachedMax)
          Center(
              child: Container(
                  height: 20,
                  width: 20,
                  child: Theme(
                      data: ThemeData(accentColor: DSColor.primaryGreen),
                      child: const CircularProgressIndicator())))
        else
          Visibility(
              visible: !hasReachedMax,
              child: TextButton(
                  child: Text('Muat lebih banyak'),
                  onPressed: () {
                    setState(() {
                      isLoading = true;
                      page++;
                    });
                    commentForumBloc.add(GetComentForum(id, page));
                  })),
        const SizedBox(
          height: 8,
        ),
      ],
    );
  }

  Widget buildAppBar(BuildContext context) {
    return AppBar(
      centerTitle: false,
      elevation: 0,
      titleSpacing: 0,
      title: Row(
        children: [
          Container(
            decoration: BoxDecoration(
                color: DSColor.primaryGreen,
                border: Border.all(color: DSColor.primaryGreen, width: 1.0),
                borderRadius: BorderRadius.all(Radius.circular(100.0))),
            padding: EdgeInsets.all(6.0),
            child: Image.asset(
              'assets/images/forum.png',
              width: 20,
            ),
          ),
          SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('${widget.datas.title}',
                  style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black)),
              SizedBox(height: 4),
              Row(
                children: [
                  Image.asset(
                    'assets/images/message-blk.png',
                    width: 8,
                  ),
                  SizedBox(width: 4),
                  Text('${widget.datas.comments_count.toString()} Komentar',
                      style: TextStyle(
                        fontSize: 10.0,
                        color: Colors.grey,
                      )),
                ],
              ),
            ],
          ),
        ],
      ),
      backgroundColor: Colors.white,
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
    );
  }
}
