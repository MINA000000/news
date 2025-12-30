import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:news/news/data/models/article.dart';
import 'package:news/news/view/widgets/news_item.dart';
import 'package:news/shared/app_theme.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsDetails extends StatelessWidget {
  const NewsDetails(this.article, {super.key});
  final Article article;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppTheme.white,
        image: DecorationImage(image: AssetImage('assets/images/pattern.png')),
      ),
      child: Scaffold(
        appBar: AppBar(title: Text('News Details'), centerTitle: true),
        body: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: NewsItem(article: article),
              ),
              SizedBox(height: 25),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Text(
                      article.description ?? 'Can\'t find description',
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w300,
                        color: AppTheme.black,
                      ),
                    ),
                    SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () async {
                            final Uri url = Uri.parse(article.url!);
                            try {
                              await launchUrl(url);
                            } catch (error) {
                              Fluttertoast.showToast(
                                msg: 'could\'t open Url',
                                backgroundColor: Colors.red,
                                textColor: Colors.white,
                              );
                            }
                          },
                          child: Text('View full article'),
                        ),
                        Icon(Icons.arrow_forward),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
