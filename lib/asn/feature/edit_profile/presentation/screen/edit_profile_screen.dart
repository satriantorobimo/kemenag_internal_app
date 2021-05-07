import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kemenag_go_internal_app/asn/feature/edit_profile/presentation/widget/form_edit_profile_widget.dart';
import 'package:kemenag_go_internal_app/asn/feature/profile/domain/repo/profile_repo.dart';
import 'package:kemenag_go_internal_app/asn/feature/profile/presentation/bloc/profile/bloc.dart';
import 'package:kemenag_go_internal_app/core/util/custom_loader.dart';

class EditProfileScreen extends StatefulWidget {
  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  ProfileBloc profileBloc = ProfileBloc(profileRepository: ProfileRepository());
  final GlobalKey<State> _keyLoader = GlobalKey<State>();

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

  Widget appBarTitle = Text(
    'Edit Profil',
    style: TextStyle(color: Colors.black, fontSize: 16),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: SingleChildScrollView(
          child: BlocListener<ProfileBloc, ProfileState>(
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
                      return FormEditProfileWidget(state.profileModel.data);
                    }
                    if (state is ProfileError) {
                      return Container();
                    }
                    return Container();
                  }))),
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
