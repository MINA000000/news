import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/news/data/data_sources/news_data_source.dart';
import 'package:news/news/data/models/article.dart';
import 'package:news/news/view_model/news_states.dart';
import 'package:news/shared/service_locator.dart';

class NewsViewModel extends Cubit<NewsState> {
  late final NewsDataSource repository;
  NewsViewModel() : super(NewsInitial()) {
    repository = ServiceLocator.newsDataSource;
  }

  List<Article> articles = [];
  bool isLoading = false;
  String? errorMessage;
  Future<void> getNews(String sourceId) async {
    emit(GetNewsLoading());
    try {
      final articles = await repository.getNews(sourceId);
      emit(GetNewsSuccess(articles));
    } catch (error) {
      emit(GetNewsError(error.toString()));
    }
  }
}
