import 'package:flutter/material.dart';
import 'package:news/l10n/app_localizations.dart';
import 'package:news/shared/app_theme.dart';
import 'package:news/categories/view/widgets/category_item.dart';
import 'package:news/categories/data/models/category_model.dart';

class CategoriesGrid extends StatelessWidget {
  const CategoriesGrid({super.key, required this.onselectedCategory});
  final void Function(CategoryModel) onselectedCategory;

  @override
  Widget build(BuildContext context) {
    final List<CategoryModel> categoriesItems = [
      CategoryModel(
        color: AppTheme.sportsColor,
        id: 'sports',
        name: AppLocalizations.of(context)!.sports,
        image: 'sports.png',
      ),
      CategoryModel(
        color: AppTheme.politicsColor,
        id: 'politics',
        name: AppLocalizations.of(context)!.politics,
        image: 'politics.png',
      ),
      CategoryModel(
        color: AppTheme.healthColor,
        id: 'health',
        name: AppLocalizations.of(context)!.health,
        image: 'health.png',
      ),
      CategoryModel(
        color: AppTheme.businessColor,
        id: 'business',
        name: AppLocalizations.of(context)!.business,
        image: 'business.png',
      ),
      CategoryModel(
        color: AppTheme.environmentColor,
        id: 'environment',
        name: AppLocalizations.of(context)!.enviroment,
        image: 'environment.png',
      ),
      CategoryModel(
        color: AppTheme.scienceColor,
        id: 'science',
        name: AppLocalizations.of(context)!.science,
        image: 'science.png',
      ),
    ];
    return Padding(
      padding: EdgeInsetsDirectional.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.only(start: 35, top: 36),
            child: Text(
              AppLocalizations.of(context)!.pickYourCategoryOfInterest,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          SizedBox(height: 20),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 24,
                crossAxisSpacing: 24,
              ),
              itemBuilder: (context, index) => GestureDetector(
                onTap: () => onselectedCategory(categoriesItems[index]),
                child: CategoryItem(
                  categoryModel: categoriesItems[index],
                  index: index,
                ),
              ),
              itemCount: 6,
            ),
          ),
        ],
      ),
    );
  }
}
