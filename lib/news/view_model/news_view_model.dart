import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/news/data/data_sources/news_data_source.dart';
import 'package:news/news/data/models/article.dart';
import 'package:news/news/view_model/news_states.dart';
import 'package:news/shared/service_locator.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsViewModel extends Cubit<NewsState> {
  late final NewsDataSource repository;
  NewsViewModel() : super(NewsInitial()) {
    repository = ServiceLocator.newsDataSource;
  }

  Future<void> getNews(String sourceId) async {
    emit(GetNewsLoading());
    try {
      final articles = await repository.getNews(sourceId);
      emit(GetNewsSuccess(articles));
    } catch (error) {
      emit(GetNewsError(error.toString()));
    }
  }

  Future<void> openUrl(String linkUrl) async {
    emit(OpenUrlLoading());
    try {
      final Uri url = Uri.parse(linkUrl);

      await Future.delayed(const Duration(seconds: 1));

      await launchUrl(url);
      emit(OpenUrlSuccess());
    } catch (error) {
      emit(OpenUrlError(error.toString()));
    }
  }

  void searchNews(String searchWord, List<Article> articles) {
    try {
      emit(SearchNewsLoading());
      final keywords = searchWord.toLowerCase().split(' ');

      List<Article> searchedArticles = articles.where((article) {
        final title = article.title!.toLowerCase();
        return keywords.every((keyword) => title.contains(keyword));
      }).toList();
      emit(SearchNewsSuccess(searchedArticles));
    } catch (error) {
      emit(SearchNewsError(error.toString()));
    }
  }
}
