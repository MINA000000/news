import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/news/view/widgets/news_item.dart';
import 'package:news/news/view_model/news_states.dart';
import 'package:news/news/view_model/news_view_model.dart';
import 'package:news/shared/widgets/error_indicator.dart';
import 'package:news/shared/widgets/loading_indicator.dart';

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
    return BlocBuilder<NewsViewModel, NewsState>(
      bloc: viewModel,
      builder: (_, state) {
        if (state is GetNewsLoading) {
          return LoadingIndicator();
        } else if (state is GetNewsError) {
          return ErrorIndicator(state.errorMessage);
        } else if (state is GetNewsSuccess) {
          return ListView.builder(
            itemBuilder: (context, index) =>
                NewsItem(article: state.articles[index]),
            itemCount: state.articles.length,
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}

// FutureBuilder(
//       future: ApiFunctions.getNews(widget.sourceId),
//       builder: (context, snapshot) {

//       },
//     );
