import 'package:news/news/data/models/article.dart';

abstract class NewsState {}

class NewsInitial extends NewsState {}

class GetNewsLoading extends NewsState {}

class GetNewsSuccess extends NewsState {
  final List<Article> articles;

  GetNewsSuccess(this.articles);
}

class GetNewsError extends NewsState {
  final String errorMessage;

  GetNewsError(this.errorMessage);
}
