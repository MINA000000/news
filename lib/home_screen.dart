import 'package:flutter/material.dart';
import 'package:news/app_theme.dart';
import 'package:news/categories/categories_grid.dart';
import 'package:news/categories/category_details.dart';
import 'package:news/models/category_model.dart';
import 'package:news/settings/Setting_tab.dart';

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
            ? CategoryDetails()
            : seletedDrawerItem == DrawerItem.categories
            ? CategoriesGrid(onselectedCategory: onselectedCategory)
            : SettingTab(),
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

class DrawerWidget extends StatelessWidget {
  DrawerWidget({super.key, required this.onSelectedItem});
  void Function(DrawerItem) onSelectedItem;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            height: MediaQuery.of(context).size.height * 0.15,
            color: AppTheme.primary,
            child: Text(
              "News App!",
              style: Theme.of(
                context,
              ).textTheme.titleLarge!.copyWith(color: AppTheme.white),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () => onSelectedItem(DrawerItem.categories),
                  child: Row(
                    children: [
                      Icon(Icons.list_alt_sharp, size: 35),
                      SizedBox(width: 10),
                      Text(
                        'Categories',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 15),
                GestureDetector(
                  onTap: () => onSelectedItem(DrawerItem.settings),
                  child: Row(
                    children: [
                      Icon(Icons.settings, size: 35),
                      SizedBox(width: 10),
                      Text(
                        'Settings',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
