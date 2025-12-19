import 'package:flutter/material.dart';
import 'package:news/app_theme.dart';
import 'package:news/models/source.dart';
import 'package:news/news/news_list.dart';
import 'package:news/tabs/sources_tabs.dart';

class CategoryDetails extends StatelessWidget {
  const CategoryDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SourcesTabs(
          sources: List.generate(
            10,
            (index) => Source(isSelected: false, sourceName: 'Source $index'),
          ),
        ),
        Expanded(child: NewsList()),
      ],
    );
  }
}
