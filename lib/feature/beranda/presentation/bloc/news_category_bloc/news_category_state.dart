import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:kemenag_go_internal_app/feature/beranda/data/model/news_category_model.dart';

abstract class NewsCategoryState extends Equatable {
  const NewsCategoryState();

  @override
  List<Object> get props => [];
}

class NewsCategoryInitial extends NewsCategoryState {}

class NewsCategoryLoading extends NewsCategoryState {}

class NewsCategoryLoaded extends NewsCategoryState {
  final NewsCategoryModel newsCategoryModel;

  const NewsCategoryLoaded({@required this.newsCategoryModel})
      : assert(newsCategoryModel != null);

  @override
  List<Object> get props => [newsCategoryModel];
}

class NewsCategoryError extends NewsCategoryState {
  final String error;

  const NewsCategoryError({@required this.error}) : assert(error != null);

  @override
  List<Object> get props => [error];
}
