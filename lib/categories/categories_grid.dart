import 'package:flutter/material.dart';
import 'package:news/app_theme.dart';
import 'package:news/categories/category_item.dart';
import 'package:news/models/category_model.dart';

class CategoriesGrid extends StatelessWidget {
  CategoriesGrid({super.key, required this.onselectedCategory});
  void Function(CategoryModel) onselectedCategory;
  List<CategoryModel> categoriesItems = [
    CategoryModel(
      color: AppTheme.sportsColor,
      id: 'sports',
      name: 'Sports',
      image: 'sports.png',
    ),
    CategoryModel(
      color: AppTheme.politicsColor,
      id: 'politics',
      name: 'Politics',
      image: 'politics.png',
    ),
    CategoryModel(
      color: AppTheme.healthColor,
      id: 'health',
      name: 'Health',
      image: 'health.png',
    ),
    CategoryModel(
      color: AppTheme.businessColor,
      id: 'business',
      name: 'Business',
      image: 'business.png',
    ),
    CategoryModel(
      color: AppTheme.environmentColor,
      id: 'environment',
      name: 'Environment',
      image: 'environment.png',
    ),
    CategoryModel(
      color: AppTheme.scienceColor,
      id: 'science',
      name: 'Science',
      image: 'science.png',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.only(start: 35, top: 36),
            child: Text(
              "Pick your category\nof interest",
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
                child: CategoryItem(categoryModel: categoriesItems[index],index: index,),
              ),
              itemCount: 6,
            ),
          ),
        ],
      ),
    );
  }
}
