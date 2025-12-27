import 'package:news/news/data/data_sources/news_api_data_source.dart';
import 'package:news/news/data/models/article.dart';

class NewsRespository {
  final dataSource = NewsApiDataSource();

  Future<List<Article>> getNews(String sourceId) {
    return dataSource.getNews(sourceId);
  }
}
