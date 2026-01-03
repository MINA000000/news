import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/news/view/screens/news_details.dart';
import 'package:news/news/view/widgets/news_item.dart';
import 'package:news/news/view_model/news_states.dart';
import 'package:news/news/view_model/news_view_model.dart';
import 'package:news/shared/app_theme.dart';
import 'package:news/shared/widgets/error_indicator.dart';
import 'package:news/shared/widgets/loading_indicator.dart';

class NewsSearch extends StatelessWidget {
  NewsSearch({super.key});
  TextEditingController searchedWord = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(image: AssetImage('assets/images/pattern.png')),
      ),
      child: Scaffold(
        appBar: AppBar(
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 17),
              child: Container(
                width: 350,
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: searchedWord,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Search Here',
                        ),
                      ),
                    ),
                    IconButton(
                      color: Colors.black,
                      icon: Icon(Icons.search_sharp, color: AppTheme.black),
                      onPressed: () {
                        final articles =
                            (context.read<NewsViewModel>().state as NewsSuccess)
                                .articles;
                        context.read<NewsViewModel>().searchNews(
                          searchedWord.text,
                          (articles),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        body: BlocBuilder<NewsViewModel, NewsState>(
          builder: (context, state) {
            if (state is GetNewsLoading || state is SearchNewsLoading) {
              return LoadingIndicator();
            } else if (state is GetNewsError || state is SearchNewsError) {
              return ErrorIndicator((state as NewsError).errorMessage);
            } else if (state is GetNewsSuccess || state is SearchNewsSuccess) {
              return ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 20),
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) =>
                            NewsDetails(state.articles[index]),
                      ),
                    );
                  },
                  child: NewsItem(article: state.articles[index]),
                ),
                itemCount: (state as NewsSuccess).articles.length,
              );
            } else {
              return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}
