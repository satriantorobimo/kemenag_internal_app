import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kemenag_go_internal_app/asn/feature/forum/domain/repo/forum_repo.dart';
import 'package:kemenag_go_internal_app/asn/feature/forum/presentation/bloc/forum/bloc.dart';
import 'package:kemenag_go_internal_app/asn/feature/forum/presentation/widget/card_menu_forum.dart';
import 'package:kemenag_go_internal_app/asn/feature/forum/data/list_forum_model.dart';
import 'package:kemenag_go_internal_app/core/resources/routes.dart';
import 'package:shimmer/shimmer.dart';

class ForumScreen extends StatefulWidget {
  ForumScreen({Key key}) : super(key: key);

  @override
  _ForumScreenState createState() => _ForumScreenState();
}

class _ForumScreenState extends State<ForumScreen> {
  ForumBloc forumBloc = ForumBloc(forumRepository: ForumRepository());

  Widget appBarTitle = Text(
    'Forum',
    style: TextStyle(color: Colors.black, fontSize: 16),
  );
  final globalKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    forumBloc.add(GetListForum());
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    forumBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: globalKey,
      appBar: buildAppBar(context),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocListener<ForumBloc, ForumState>(
            cubit: forumBloc,
            listener: (_, ForumState state) {
              if (state is ForumError) {
                if (state.error == 'expired') {
                  print('expired');
                  Navigator.pushNamed(context, loginRoute);
                }
              }
            },
            child: BlocBuilder<ForumBloc, ForumState>(
                cubit: forumBloc,
                builder: (_, ForumState state) {
                  if (state is ForumInitial) {
                    return _skeletonLoading();
                  }
                  if (state is ForumLoading) {
                    return _skeletonLoading();
                  }
                  if (state is ForumLoaded) {
                    return _forumContent(state.listForumModel);
                    // return _skeletonLoading();
                  }
                  if (state is ForumError) {
                    return _skeletonLoading();
                  }
                  return _skeletonLoading();
                })),
      ),
    );
  }

  Widget _skeletonLoading() {
    return ListView.separated(
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(height: 16);
        },
        itemCount: 10,
        scrollDirection: Axis.vertical,
        physics: ScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) => Shimmer.fromColors(
            baseColor: Colors.grey.withOpacity(0.4),
            highlightColor: Colors.white,
            child: SizedBox(
              width: double.infinity,
              height: 80,
              child: Card(),
            )));
  }

  Widget _forumContent(ListForumModel listForumModel) {
    return ListView.separated(
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(height: 16);
        },
        itemCount: listForumModel.data.total,
        scrollDirection: Axis.vertical,
        physics: ScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) => CardMenuForumWidget(
              image: Image.asset(
                'assets/images/forum.png',
                width: 22,
              ),
              onTap: () {
                Navigator.pushNamed(context, forumDetailRoute,
                    arguments: listForumModel.data.data[index]);
              },
              title: listForumModel.data.data[index].title,
              subTitle:
                  listForumModel.data.data[index].comments_count.toString(),
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
}
