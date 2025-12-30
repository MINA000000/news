import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news/shared/app_theme.dart';
import 'package:news/news/data/models/article.dart';
import 'package:news/shared/default_images.dart';
import 'package:news/shared/widgets/loading_indicator.dart';
import 'package:timeago/timeago.dart' as timeago;

class NewsItem extends StatelessWidget {
  const NewsItem({super.key, required this.article});

  final Article article;
  // final fifteenAgo = DateTime.now().subtract(Duration(minutes: 15));
  @override
  Widget build(BuildContext context) {
    // return Text("hello world");
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: CachedNetworkImage(
            imageUrl: article.urlToImage ?? DefaultImages.newsDefaultImage,
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
          style: Theme.of(
            context,
          ).textTheme.titleSmall!.copyWith(color: AppTheme.grey, fontSize: 10),
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
    );
  }
}
