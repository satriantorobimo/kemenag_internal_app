import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:kemenag_go_internal_app/feature/beranda/data/model/news_model.dart';

abstract class NewsState extends Equatable {
  const NewsState();

  @override
  List<Object> get props => [];
}

class NewsInitial extends NewsState {}

class NewsLoading extends NewsState {}

class NewsLoaded extends NewsState {
  final NewsModel newsModel;

  const NewsLoaded({@required this.newsModel}) : assert(newsModel != null);

  @override
  List<Object> get props => [newsModel];
}

class NewsError extends NewsState {
  final String error;

  const NewsError({@required this.error}) : assert(error != null);

  @override
  List<Object> get props => [error];
}
