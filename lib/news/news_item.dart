import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news/app_theme.dart';
import 'package:news/models/news_reponse/article.dart';
import 'package:news/widgets/loading_indicator.dart';
import 'package:timeago/timeago.dart' as timeago;

class NewsItem extends StatelessWidget {
  NewsItem({super.key, required this.article});

  Article article;
  // final fifteenAgo = DateTime.now().subtract(Duration(minutes: 15));
  @override
  Widget build(BuildContext context) {
    // return Text("hello world");
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: CachedNetworkImage(
              imageUrl:
                  article.urlToImage ??
                  'https://www.rootinc.com/wp-content/uploads/2022/11/placeholder-1-768x512.png',
              width: double.infinity,
              height: MediaQuery.sizeOf(context).height * 0.25,
              fit: BoxFit.fill,
              placeholder: (context, url) => Center(child: LoadingIndicator()),
              errorWidget: (context, url, error) =>
                  Center(child: Icon(Icons.error_outline_outlined)),
            ),
          ),
          SizedBox(height: 5),
          Text(
            article.source!.name!,
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
              color: AppTheme.grey,
              fontSize: 10,
            ),
          ),
          Text(
            article.title!,
            style: Theme.of(
              context,
            ).textTheme.titleSmall!.copyWith(color: AppTheme.navy),
          ),
          Align(
            alignment: AlignmentDirectional.centerEnd,
            child: Text(
              timeago.format(article.publishedAt!),
              style: Theme.of(
                context,
              ).textTheme.titleSmall!.copyWith(color: AppTheme.grey),
            ),
          ),
          SizedBox(height: 5),
        ],
      ),
    );
  }
}
