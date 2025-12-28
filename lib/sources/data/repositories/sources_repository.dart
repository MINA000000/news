import 'package:news/sources/data/data_sources/sources_data_source.dart';
import 'package:news/sources/data/models/sources.dart';

class SourcesRepository {
  final SourcesDataSource dataSource;

  SourcesRepository(this.dataSource);

  Future<List<Sources>> getSources(categoryId) {
    return dataSource.getSources(categoryId);
  }
}
