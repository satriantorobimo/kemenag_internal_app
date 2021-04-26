import 'package:equatable/equatable.dart';

abstract class NewsCategoryEvent extends Equatable {
  const NewsCategoryEvent();

  @override
  List<Object> get props => [];
}

class GetNewsCategory extends NewsCategoryEvent {
  @override
  List<Object> get props => [];
}
