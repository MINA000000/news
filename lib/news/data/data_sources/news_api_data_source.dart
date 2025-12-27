import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news/news/data/models/article.dart';
import 'package:news/shared/api_constants.dart';
import 'package:news/news/data/models/news_response.dart';

class NewsApiDataSource {
  Future<List<Article>> getNews(String sourceId) async {
    var uri = Uri.https(ApiConstants.baseUrl, ApiConstants.newsUrl, {
      'apiKey': ApiConstants.apiKey,
      'sources': sourceId,
    });
    var response = await http.get(uri);
    var json = jsonDecode(response.body);
    final newsResponse = NewsResponse.fromJson(json);
    if (newsResponse.status == 'ok' && newsResponse.articles != null) {
      return newsResponse.articles!;
    } else {
      throw Exception('Failed to get News');
    }
  }
}
