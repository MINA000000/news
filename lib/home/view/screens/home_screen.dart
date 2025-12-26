import 'package:flutter/material.dart';
import 'package:news/home/view/widgets/drawer_widget.dart';
import 'package:news/shared/app_theme.dart';
import 'package:news/categories/view/widgets/categories_grid.dart';
import 'package:news/categories/view/widgets/category_details.dart';
import 'package:news/categories/data/models/category_model.dart';
import 'package:news/settings/view/widgets/settings_tab.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const String route = '/home_screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DrawerItem seletedDrawerItem = DrawerItem.categories;
  CategoryModel? selectedCategoryModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppTheme.white,
        image: DecorationImage(image: AssetImage('assets/images/pattern.png')),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            selectedCategoryModel != null
                ? selectedCategoryModel!.name
                : seletedDrawerItem == DrawerItem.categories
                ? 'News App'
                : 'Settings',
          ),
        ),
        body: selectedCategoryModel != null
            ? CategoryDetails(categoryId: selectedCategoryModel!.id,)
            : seletedDrawerItem == DrawerItem.categories
            ? CategoriesGrid(onselectedCategory: onselectedCategory)
            : SettingsTab(),
        drawer: DrawerWidget(onSelectedItem: onSelectedDrawerItem),
      ),
    );
  }

  void onSelectedDrawerItem(DrawerItem item) {
    selectedCategoryModel = null;
    seletedDrawerItem = item;
    setState(() {});
    Navigator.of(context).pop();
  }

  void onselectedCategory(CategoryModel category) {
    selectedCategoryModel = category;
    setState(() {});
  }
}

enum DrawerItem { categories, settings }
