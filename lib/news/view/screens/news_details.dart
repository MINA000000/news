import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:news/l10n/app_localizations.dart';
import 'package:news/news/data/models/article.dart';
import 'package:news/news/view/widgets/news_item.dart';
import 'package:news/news/view_model/news_states.dart';
import 'package:news/news/view_model/news_view_model.dart';
import 'package:news/shared/app_theme.dart';
import 'package:news/shared/widgets/loading_indicator.dart';

class NewsDetails extends StatelessWidget {
  const NewsDetails(this.article, {super.key});
  final Article article;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => NewsViewModel(),
      child: Container(
        decoration: BoxDecoration(
          color: AppTheme.white,
          image: DecorationImage(
            image: AssetImage('assets/images/pattern.png'),
          ),
        ),
        child: BlocListener<NewsViewModel, NewsState>(
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
                msg: AppLocalizations.of(context)!.failedToOpenTheLink,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                toastLength: Toast.LENGTH_LONG,
              );
            } else {
              hideLoadingDialog(context);
            }
          },
          child: Builder(
            builder: (context) {
              return Scaffold(
                appBar: AppBar(title: Text(AppLocalizations.of(context)!.minaNasser), centerTitle: true),
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
                              article.description ?? AppLocalizations.of(context)!.cantFindDescription,
                              style: Theme.of(context).textTheme.titleSmall
                                  ?.copyWith(
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
                                    context.read<NewsViewModel>().openUrl(
                                      article.url!,
                                    );
                                  },
                                  child: Text(AppLocalizations.of(context)!.viewfullarticle),
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
              );
            },
          ),
        ),
      ),
    );
  }
}

void hideLoadingDialog(BuildContext context) {
  Navigator.of(context, rootNavigator: true).pop();
}
