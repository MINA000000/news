import 'package:news/models/news_reponse/article.dart';

class NewsResponse {
    NewsResponse({
        required this.status,
        required this.totalResults,
        required this.articles,
    });

    final String? status;
    final int? totalResults;
    final List<Article> articles;

    factory NewsResponse.fromJson(Map<String, dynamic> json){ 
        return NewsResponse(
            status: json["status"],
            totalResults: json["totalResults"],
            articles: json["articles"] == null ? [] : List<Article>.from(json["articles"]!.map((x) => Article.fromJson(x))),
        );
    }

    Map<String, dynamic> toJson() => {
        "status": status,
        "totalResults": totalResults,
        "articles": articles.map((x) => x?.toJson()).toList(),
    };

}