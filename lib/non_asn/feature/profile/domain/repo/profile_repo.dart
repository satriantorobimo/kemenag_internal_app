import 'dart:async';

import 'package:kemenag_go_internal_app/non_asn/feature/profile/data/profile_model.dart';
import 'package:kemenag_go_internal_app/non_asn/feature/profile/domain/api/profile_api.dart';

class ProfileRepository {
  ProfileApiClient profileApiClient = ProfileApiClient();

  Future<ProfileModel> getProfile() => profileApiClient.getProfile();
}
