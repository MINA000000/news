import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news/shared/api_constants.dart';
import 'package:news/news/data/models/news_response.dart';

class NewsDataSource {
  Future<NewsResponse> getNews(String sourceId) async {
    var uri = Uri.https(ApiConstants.baseUrl, ApiConstants.newsUrl, {
      'apiKey': ApiConstants.apiKey,
      'sources': sourceId,
    });
    var response = await http.get(uri);
    var json = jsonDecode(response.body);
    return NewsResponse.fromJson(json);
  }
}
