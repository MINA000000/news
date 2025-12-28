import 'package:flutter/material.dart';
import 'package:news/shared/service_locator.dart';
import 'package:news/sources/data/data_sources/sources_data_source.dart';
import 'package:news/sources/data/models/sources.dart';

class SourcesViewModel with ChangeNotifier {
  late final SourcesDataSource repository;
  SourcesViewModel() {
    repository = ServiceLocator.sourcesDataSource;
  }
  List<Sources> sourcesList = [];
  String? errorMessage;
  bool isLoading = false;
  Future<void> getSources(String categoryId) async {
    isLoading = true;
    notifyListeners();
    try {
      sourcesList = await repository.getSources(categoryId);
    } catch (error) {
      errorMessage = error.toString();
    }
    isLoading = false;
    notifyListeners();
  }
}
