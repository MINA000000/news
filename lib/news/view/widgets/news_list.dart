import 'package:flutter/material.dart';
import 'package:news/news/view/widgets/news_item.dart';
import 'package:news/news/view_model/news_view_model.dart';
import 'package:news/shared/widgets/error_indicator.dart';
import 'package:news/shared/widgets/loading_indicator.dart';
import 'package:provider/provider.dart';

class NewsList extends StatefulWidget {
  const NewsList({super.key, required this.sourceId});
  final String sourceId;

  @override
  State<NewsList> createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
  final viewModel = NewsViewModel();
  @override
  Widget build(BuildContext context) {
    viewModel.getNews(widget.sourceId);
    return ChangeNotifierProvider(
      create: (_) => viewModel,
      child: Consumer<NewsViewModel>(
        builder: (_, viewModel, __) {
          if (viewModel.isLoading) {
            return LoadingIndicator();
          } else if (viewModel.errorMessage != null) {
            return ErrorIndicator(viewModel.errorMessage!);
          } else {
            final articles = viewModel.articles;
            return ListView.builder(
              itemBuilder: (context, index) =>
                  NewsItem(article: articles[index]),
              itemCount: articles.length,
            );
          }
        },
      ),
    );
  }
}

// FutureBuilder(
//       future: ApiFunctions.getNews(widget.sourceId),
//       builder: (context, snapshot) {

//       },
//     );
