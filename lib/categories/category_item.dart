import 'package:flutter/material.dart';
import 'package:news/app_theme.dart';
import 'package:news/models/category_model.dart';

class CategoryItem extends StatelessWidget {
  CategoryItem({super.key, required this.categoryModel}); 
  CategoryModel categoryModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: categoryModel.color,
        borderRadius: BorderRadiusDirectional.only(
          topEnd: Radius.circular(25),
          topStart: Radius.circular(25),
          bottomEnd: categoryModel.id.isOdd
              ? Radius.circular(25)
              : Radius.circular(0),
          bottomStart: categoryModel.id.isEven
              ? Radius.circular(25)
              : Radius.circular(0),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 120,
            width: 120,
            child: Image.asset('assets/images/${categoryModel.image}'),
          ),
          Text(
            categoryModel.name,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w400,
              color: AppTheme.white,
            ),
          ),
        ],
      ),
    );
  }
}
