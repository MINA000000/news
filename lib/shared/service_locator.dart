import 'package:news/news/data/data_sources/news_api_data_source.dart';
import 'package:news/sources/data/data_sources/sources_api_data_source.dart';

class ServiceLocator {
  static final sourcesDataSource = SourcesApiDataSource();
  static final newsDataSource = NewsApiDataSource();
}
