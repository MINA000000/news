import 'package:news/sources/data/data_sources/sources_api_data_source.dart';
import 'package:news/sources/data/models/sources.dart';

class SourcesRepository {
  final dataSource = SourcesApiDataSource();
  
  Future<List<Sources>> getSources(categoryId){
    return dataSource.getSources(categoryId);
  }
}