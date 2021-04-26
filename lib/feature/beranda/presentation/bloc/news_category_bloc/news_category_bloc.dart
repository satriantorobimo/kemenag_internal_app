import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:kemenag_go_internal_app/feature/beranda/data/model/news_category_model.dart';
import 'package:kemenag_go_internal_app/feature/beranda/domain/repo/news_category_repo.dart';
import 'bloc.dart';

class NewsCategoryBloc extends Bloc<NewsCategoryEvent, NewsCategoryState> {
  NewsCategoryBloc({@required this.newsCategoryRepository})
      : assert(newsCategoryRepository != null),
        super(NewsCategoryInitial());

  final NewsCategoryRepository newsCategoryRepository;
  NewsCategoryModel newsCategoryModel;

  @override
  Stream<NewsCategoryState> mapEventToState(
    NewsCategoryEvent event,
  ) async* {
    if (event is GetNewsCategory) {
      yield NewsCategoryLoading();
      try {
        newsCategoryModel = await newsCategoryRepository.getNewsCategory();
        yield NewsCategoryLoaded(newsCategoryModel: newsCategoryModel);
      } catch (e) {
        yield NewsCategoryError(error: e);
      }
    }
  }
}
