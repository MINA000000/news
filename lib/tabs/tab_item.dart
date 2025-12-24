import 'package:flutter/material.dart';
import 'package:news/app_theme.dart';
import 'package:news/models/sources_response/sources.dart';

class TabItem extends StatelessWidget {
  TabItem({super.key, required this.source});
  Sources source;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),

      decoration: BoxDecoration(
        color: source.isSelected ? AppTheme.primary : null,
        border: Border.all(color: AppTheme.primary, width: 2),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Text(
        source.name!,
        style: Theme.of(context).textTheme.titleSmall!.copyWith(
          color: source.isSelected ? AppTheme.white : AppTheme.primary,
        ),
      ),
    );
  }
}
