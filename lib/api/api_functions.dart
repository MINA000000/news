import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news/api/api_constants.dart';
import 'package:news/models/news_reponse/news_response.dart';
import 'package:news/models/sources_response/sources_response.dart';

class ApiFunctions {
  static Future<SourcesResponse> getSources(String categoryId) async {
    var uri = Uri.https(ApiConstants.baseUrl, ApiConstants.sourcesUrl, {
      'apiKey': ApiConstants.APIKey,
      'category': categoryId,
    });
    var response = await http.get(uri);
    var json = jsonDecode(response.body);
    return SourcesResponse.fromJson(json);
  }

  static Future<NewsResponse> getNews(String sourceId) async {
    var uri = Uri.https(ApiConstants.baseUrl, ApiConstants.newsUrl, {
      'apiKey': ApiConstants.APIKey,
      'sources': sourceId,
    });
    var response = await http.get(uri);
    var json = jsonDecode(response.body);
    return NewsResponse.fromJson(json);
  }
}
