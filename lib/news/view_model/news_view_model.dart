import 'package:flutter/material.dart';
import 'package:news/news/data/models/article.dart';
import 'package:news/news/data/repositories/news_respository.dart';

class NewsViewModel with ChangeNotifier {
  final newsRepository = NewsRespository();
  List<Article> articles = [];
  bool isLoading = false;
  String? errorMessage;
  Future<void> getNews(String sourceId) async {
    isLoading = true;
    notifyListeners();
    try {
      articles = await newsRepository.getNews(sourceId);
    } catch (error) {
      errorMessage = error.toString();
    }
    isLoading = false;
    notifyListeners();
  }
}
