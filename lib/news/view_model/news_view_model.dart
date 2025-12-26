import 'package:flutter/material.dart';
import 'package:news/news/data/data_sources/news_data_source.dart';
import 'package:news/news/data/models/article.dart';

class NewsViewModel with ChangeNotifier {
  final dataSource = NewsDataSource();
  List<Article> articles = [];
  bool isLoading = false;
  String? errorMessage;
  Future<void> getNews(String sourceId) async {
    isLoading = true;
    notifyListeners();
    try {
      final response = await dataSource.getNews(sourceId);
      if (response.status == 'ok' && response.articles != null) {
        articles = response.articles!;
      }
      else {
        errorMessage = 'Failed to get News';
      }
    } catch (error) {
      errorMessage = error.toString();
    }
    isLoading = false;
    notifyListeners();
  }
}
