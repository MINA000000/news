import 'package:news/news/data/models/article.dart';

abstract class NewsState {}

class NewsInitial extends NewsState {}

class NewsError extends NewsState {
  final String errorMessage;

  NewsError(this.errorMessage);
}

class NewsSuccess extends NewsState {
  final List<Article> articles;
  NewsSuccess(this.articles);
}

class GetNewsLoading extends NewsState {}

class GetNewsSuccess extends NewsSuccess {
  GetNewsSuccess(super.articles);
}

class GetNewsError extends NewsError {
  GetNewsError(super.errorMessage);
}

class SearchNewsLoading extends NewsState {}

class SearchNewsSuccess extends NewsSuccess {
  SearchNewsSuccess(super.articles);
}

class SearchNewsError extends NewsError {
  SearchNewsError(super.errorMessage);
}

class OpenUrlLoading extends NewsState {}

class OpenUrlSuccess extends NewsState {}

class OpenUrlError extends NewsState {
  final String errorMessage;
  OpenUrlError(this.errorMessage);
}
