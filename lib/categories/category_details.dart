import 'package:flutter/material.dart';
import 'package:news/api/api_functions.dart';
import 'package:news/tabs/sources_tabs.dart';
import 'package:news/widgets/error_indicator.dart';
import 'package:news/widgets/loading_indicator.dart';

class CategoryDetails extends StatefulWidget {
  const CategoryDetails({required this.categoryId, super.key});
  final String categoryId;

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiFunctions.getSources(widget.categoryId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return LoadingIndicator();
        } else if (snapshot.hasError || snapshot.data!.status != 'ok') {
          return ErrorIndicator();
        } else {
          final sources = snapshot.data!.sources ?? [];
          return SourcesTabs(sources: sources);
        }
      },
    );
  }
}
