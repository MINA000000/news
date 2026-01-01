import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:news/news/data/models/article.dart';
import 'package:news/news/view/widgets/news_item.dart';
import 'package:news/news/view_model/news_states.dart';
import 'package:news/news/view_model/news_view_model.dart';
import 'package:news/shared/app_theme.dart';
import 'package:news/shared/widgets/loading_indicator.dart';

class Pare extends StatelessWidget {
  Pare(this.article, {super.key});
  final Article article;

  final viewModel = NewsViewModel();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => viewModel,
      child: Container(
        decoration: BoxDecoration(
          color: AppTheme.white,
          image: DecorationImage(
            image: AssetImage('assets/images/pattern.png'),
          ),
        ),
        child: NewsDetails(article),
      ),
    );
  }
}

class NewsDetails extends StatelessWidget {
  const NewsDetails(this.article, {super.key});
  final Article article;
  @override
  Widget build(BuildContext context) {
    return BlocListener<NewsViewModel, NewsState>(
      listener: (_, state) {
        if (state is OpenUrlLoading) {
          showDialog(
            context: context,
            builder: (context) {
              return LoadingIndicator();
            },
          );
        } else if (state is OpenUrlError) {
          hideLoadingDialog(context);
          Fluttertoast.showToast(
            msg: 'Failed to open the link',
            backgroundColor: Colors.red,
            textColor: Colors.white,
            toastLength: Toast.LENGTH_LONG,
          );
        } else {
          hideLoadingDialog(context);
        }
      },

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
                          onTap: () {
                            context.read<NewsViewModel>().openUrl(article.url!);
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

void hideLoadingDialog(BuildContext context) {
  Navigator.of(context, rootNavigator: true).pop();
}
