import 'package:news/news/data/models/article.dart';

abstract class NewsDataSource {
  Future<List<Article>> getNews(String sourceId);
}
