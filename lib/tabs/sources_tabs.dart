import 'package:flutter/material.dart';
import 'package:news/models/sources_response/sources.dart';
import 'package:news/news/news_list.dart';
import 'package:news/tabs/tab_item.dart';

class SourcesTabs extends StatefulWidget {
  const SourcesTabs({super.key, required this.sources});
  final List<Sources> sources;
  @override
  State<SourcesTabs> createState() => _SourcesTabsState();
}

class _SourcesTabsState extends State<SourcesTabs> {
  int selectedIndex = 0; // sources shouldn't be empty (this is actually a bug)
  @override
  Widget build(BuildContext context) {
    for (var element in widget.sources) {
      element.isSelected = false;
    }
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
        Expanded(child: NewsList(sourceId: widget.sources[selectedIndex].id!)),
      ],
    );
  }
}
