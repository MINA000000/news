import 'package:flutter/material.dart';

class CategoryModel {
  final String id;
  final String name;
  final String image;
  final Color color;

  CategoryModel({
    required this.color,
    required this.id,
    required this.name,
    required this.image,
  });
}
