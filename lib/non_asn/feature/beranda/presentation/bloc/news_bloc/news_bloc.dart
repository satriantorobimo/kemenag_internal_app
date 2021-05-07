import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:kemenag_go_internal_app/non_asn/feature/beranda/data/model/news_model.dart';
import 'package:kemenag_go_internal_app/non_asn/feature/beranda/domain/repo/news_repo.dart';

import 'bloc.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  NewsBloc({@required this.newsRepository})
      : assert(newsRepository != null),
        super(NewsInitial());

  final NewsRepository newsRepository;
  NewsModel newsModel;

  @override
  Stream<NewsState> mapEventToState(
    NewsEvent event,
  ) async* {
    if (event is GetNews) {
      yield NewsLoading();
      try {
        newsModel = await newsRepository.getNews();
        yield NewsLoaded(newsModel: newsModel);
      } catch (e) {
        yield NewsError(error: e.toString());
      }
    }
  }
}
