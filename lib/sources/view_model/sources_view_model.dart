import 'package:flutter/material.dart';
import 'package:news/sources/data/models/sources.dart';
import 'package:news/sources/data/repositories/sources_repository.dart';

class SourcesViewModel with ChangeNotifier {
  final repository = SourcesRepository();
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
