import 'package:flutter/material.dart';
import 'package:news/sources/data/data_sources/sources_data_source.dart';
import 'package:news/sources/data/models/sources.dart';

class SourcesViewModel with ChangeNotifier {
  final dataSource = SourcesDataSource();
  List<Sources> sources = [];
  String? errorMessage;
  bool isLoading = false;
  Future<void> getSources(String categoryId) async {
    isLoading = true;
    notifyListeners();
    try {
      final response = await dataSource.getSources(categoryId);
      if (response.sources != null && response.status == 'ok') {
        sources = response.sources!;
        errorMessage = null;
      } else {
        errorMessage = 'Failed to get sources';
      }
    } catch (error) {
      errorMessage = error.toString();
    }
    isLoading = false;
    notifyListeners();
  }
}
