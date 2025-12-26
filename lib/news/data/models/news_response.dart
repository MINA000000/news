import 'package:news/news/data/models/article.dart';

class NewsResponse {
    NewsResponse({
        required this.status,
        required this.totalResults,
        required this.articles,
    });

    final String? status;
    final int? totalResults;
    final List<Article>? articles;

    factory NewsResponse.fromJson(Map<String, dynamic> json){ 
        return NewsResponse(
            status: json["status"],
            totalResults: json["totalResults"],
            articles: json["articles"] == null ? null : List<Article>.from(json["articles"]!.map((x) => Article.fromJson(x))),
        );
    }

   

}