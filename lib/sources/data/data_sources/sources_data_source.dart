import 'package:news/sources/data/models/sources.dart';

abstract class SourcesDataSource {
  Future<List<Sources>> getSources(String categoryId);
}
