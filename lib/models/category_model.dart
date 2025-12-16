import 'package:flutter/material.dart';

class CategoryModel {
  int id;
  String name;
  String image;
  Color color;

  CategoryModel({
    required this.color,
    required this.id,
    required this.name,
    required this.image,
  });
}
