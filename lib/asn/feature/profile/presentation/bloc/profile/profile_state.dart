import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:kemenag_go_internal_app/asn/feature/profile/data/profile_model.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object> get props => [];
}

class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileLoaded extends ProfileState {
  final ProfileModel profileModel;

  const ProfileLoaded({@required this.profileModel})
      : assert(profileModel != null);

  @override
  List<Object> get props => [profileModel];
}

class ProfileError extends ProfileState {
  final String error;

  const ProfileError({@required this.error}) : assert(error != null);

  @override
  List<Object> get props => [error];
}
