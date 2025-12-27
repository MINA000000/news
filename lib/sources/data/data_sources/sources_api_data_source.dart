import 'dart:convert';
import 'package:news/shared/api_constants.dart';
import 'package:news/sources/data/models/sources.dart';
import 'package:news/sources/data/models/sources_response.dart';
import 'package:http/http.dart' as http;

class SourcesApiDataSource {
  Future<List<Sources>> getSources(String categoryId) async {
    var uri = Uri.https(ApiConstants.baseUrl, ApiConstants.sourcesUrl, {
      'apiKey': ApiConstants.apiKey,
      'category': categoryId,
    });
    var response = await http.get(uri);
    var json = jsonDecode(response.body);
    final sourcesResponse = SourcesResponse.fromJson(json);
    if (sourcesResponse.sources != null && sourcesResponse.status == 'ok') {
      return sourcesResponse.sources!;
    } else {
      throw Exception('Failed to get Sources');
    }
  }
}
