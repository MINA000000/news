import 'package:flutter/material.dart';
import 'package:news/models/source.dart';
import 'package:news/news/news_list.dart';
import 'package:news/tabs/tab_item.dart';

class SourcesTabs extends StatefulWidget {
  SourcesTabs({super.key, required this.sources});
  List<Source> sources;

  @override
  State<SourcesTabs> createState() => _SourcesTabsState();
}

class _SourcesTabsState extends State<SourcesTabs> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    widget.sources.forEach((element) => element.isSelected = false);
    return Column(
      children: [
        DefaultTabController(
          length: widget.sources.length,
          child: TabBar(
            onTap: (index) {
              selectedIndex = index;
              setState(() {});
            },
            isScrollable: true,
            dividerColor: Colors.transparent,
            indicatorColor: Colors.transparent,

            tabAlignment: TabAlignment.start,
            tabs: widget.sources.map((source) {
              if (widget.sources.indexOf(source) == selectedIndex) {
                source.isSelected = true;
              }
              return TabItem(source: source);
            }).toList(),
          ),
        ),
      ],
    );
  }
}
