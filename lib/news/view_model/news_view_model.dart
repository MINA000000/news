import 'package:flutter/material.dart';
import 'package:news/news/data/data_sources/news_data_source.dart';
import 'package:news/news/data/models/article.dart';
import 'package:news/shared/service_locator.dart';

class NewsViewModel with ChangeNotifier {
  late final NewsDataSource repository;
  NewsViewModel() {
    repository = ServiceLocator.newsDataSource;
  }

  List<Article> articles = [];
  bool isLoading = false;
  String? errorMessage;
  Future<void> getNews(String sourceId) async {
    isLoading = true;
    notifyListeners();
    try {
      articles = await repository.getNews(sourceId);
    } catch (error) {
      errorMessage = error.toString();
    }
    isLoading = false;
    notifyListeners();
  }
}
