import 'package:flutter/material.dart';

class Category {
  final String id;
  final String title;
  final String imgUrl;
  final VoidCallback onTap;

  Category(
      {required this.id,
      required this.title,
      required this.imgUrl,
      required this.onTap});
}

List<Category> dummyCategories = [
  Category(
    id: "1",
    title: "women's hand watch",
    imgUrl:'assets/images/WHW.png',
    onTap: () {},
  ),
  Category(
    id: "2",
    title: "men's hand watch",
    imgUrl:'assets/images/MHW.png',
    onTap: () {},
  ),
  Category(
    id: "3",
    title: "luxury hand watch",
    imgUrl:'assets/images/luxuryhandwash.jpg',
    onTap: () {},
  ),
];