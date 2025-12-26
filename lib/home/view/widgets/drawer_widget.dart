import 'package:flutter/material.dart';
import 'package:news/home/view/screens/home_screen.dart';
import 'package:news/shared/app_theme.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key, required this.onSelectedItem});
  final void Function(DrawerItem) onSelectedItem;
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
