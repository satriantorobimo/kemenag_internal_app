import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:kemenag_go_internal_app/non_asn/feature/profile/data/profile_model.dart';
import 'package:kemenag_go_internal_app/non_asn/feature/profile/domain/repo/profile_repo.dart';
import 'bloc.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc({@required this.profileRepository})
      : assert(profileRepository != null),
        super(ProfileInitial());

  ProfileRepository profileRepository;
  ProfileModel profileModel;

  @override
  Stream<ProfileState> mapEventToState(
    ProfileEvent event,
  ) async* {
    if (event is GetProfile) {
      yield ProfileLoading();
      try {
        profileModel = await profileRepository.getProfile();
        if (profileModel.status == 200) {
          yield ProfileLoaded(profileModel: profileModel);
        } else {
          yield ProfileError(error: 'no-match');
        }
      } catch (e) {
        yield ProfileError(error: 'expired');
      }
    }
  }
}
