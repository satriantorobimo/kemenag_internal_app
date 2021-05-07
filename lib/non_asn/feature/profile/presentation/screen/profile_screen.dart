import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kemenag_go_internal_app/non_asn/feature/profile/data/profile_model.dart';
import 'package:kemenag_go_internal_app/non_asn/feature/profile/domain/repo/profile_repo.dart';
import 'package:kemenag_go_internal_app/non_asn/feature/profile/presentation/bloc/profile/bloc.dart';
import 'package:kemenag_go_internal_app/core/design_system/colors.dart';
import 'package:kemenag_go_internal_app/core/util/custom_loader.dart';
import 'package:kemenag_go_internal_app/non_asn/feature/profile/presentation/widget/avatar_widget.dart';
import 'package:kemenag_go_internal_app/non_asn/feature/profile/presentation/widget/menu_widget.dart';
import 'package:kemenag_go_internal_app/non_asn/feature/profile/presentation/widget/profile_detail_widget.dart';

class ProfileNonAsnScreen extends StatefulWidget {
  ProfileNonAsnScreen({Key key}) : super(key: key);

  @override
  _ProfileNonAsnScreenState createState() => _ProfileNonAsnScreenState();
}

class _ProfileNonAsnScreenState extends State<ProfileNonAsnScreen> {
  ProfileBloc profileBloc = ProfileBloc(profileRepository: ProfileRepository());
  final GlobalKey<State> _keyLoader = GlobalKey<State>();

  Widget appBarTitle = Text(
    'Profil',
    style: TextStyle(color: Colors.black, fontSize: 16),
  );
  Icon icon = Icon(
    Icons.search,
    color: Colors.black,
    size: 18,
  );
  final globalKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    profileBloc.add(GetProfile());
    super.initState();
  }

  @override
  void dispose() {
    profileBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        key: globalKey,
        appBar: buildAppBar(context),
        body: BlocListener<ProfileBloc, ProfileState>(
            cubit: profileBloc,
            listener: (_, ProfileState state) {
              if (state is ProfileLoading) {
                LoaderDialogs.showLoadingDialog(context, _keyLoader);
              }
              if (state is ProfileLoaded) {
                Navigator.of(_keyLoader.currentContext, rootNavigator: true)
                    .pop();
              }
              if (state is ProfileError) {
                Navigator.of(_keyLoader.currentContext, rootNavigator: true)
                    .pop();
              }
            },
            child: BlocBuilder<ProfileBloc, ProfileState>(
                cubit: profileBloc,
                builder: (_, ProfileState state) {
                  if (state is ProfileInitial) {
                    return Container();
                  }
                  if (state is ProfileLoading) {
                    return Container();
                  }
                  if (state is ProfileLoaded) {
                    return _mainContent(state.profileModel);
                  }
                  if (state is ProfileError) {
                    return Container();
                  }
                  return Container();
                })));
  }

  Widget _mainContent(ProfileModel profileModel) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            profileModel.data.user_detail == null
                ? AvatarNonAsnWidget('')
                : AvatarNonAsnWidget(profileModel.data.user_detail.url_photo),
            SizedBox(height: 16),
            ProfileNonAsnDetailWidget(profileModel.data),
            MenuNonAsnWidget()
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
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: Row(
            children: [
              Icon(Icons.edit_rounded, size: 14, color: DSColor.primaryGreen),
              SizedBox(width: 8),
              Text('Edit Profil',
                  style: TextStyle(fontSize: 11, color: DSColor.primaryGreen))
            ],
          ),
        )
      ],
    );
  }
}
