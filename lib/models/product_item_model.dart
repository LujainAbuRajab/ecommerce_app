import 'package:ecommerce_app/models/category.dart';
import 'package:ecommerce_app/utils/app_assets.dart';

enum ProductSize {
  S,
  M,
  L,
  XL,
}

class ProductItemModel {
  final String id;
  final String name;
  final String imgUrl;
  final String description;
  final double price;
  final Category category;
  final ProductSize? size;
  final double averageRate;

  ProductItemModel({
    required this.id,
    required this.name,
    required this.imgUrl,
    this.size,
    this.description =
        'Lorem Ipsum is simply dummy text of the printing and typesetting industry Lorem Ipsum is simply dummy text of the printing and typesetting industry Lorem Ipsum is simply dummy text of the printing and typesetting industry Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
    required this.price,
    required this.category,
    this.averageRate = 4.5,
  });

  ProductItemModel copyWith({
    String? id,
    String? name,
    String? imgUrl,
    String? description,
    double? price,
    Category? category,
    double? averageRate,
    int? quantity,
    ProductSize? size,
  }) {
    return ProductItemModel(
      id: id ?? this.id,
      name: name ?? this.name,
      imgUrl: imgUrl ?? this.imgUrl,
      description: description ?? this.description,
      price: price ?? this.price,
      category: category ?? this.category,
      averageRate: averageRate ?? this.averageRate,
      size: size ?? this.size,
    );
  }
}

List<ProductItemModel> favProducts = []; 

List<ProductItemModel> dummyProducts = [
  ProductItemModel(
    id: '1',
    name: 'Black wristwatch',
    imgUrl:
        AppAssets.w1,
    price: 10,
    category: dummyCategories[0],
  ),
  ProductItemModel(
    id: '2',
    name: 'Grey wristwatch',
    imgUrl: AppAssets.w2,
    price: 20,
    category: dummyCategories[0],
  ),
  ProductItemModel(
    id: '3',
    name: 'white wristwatch',
    imgUrl:
       AppAssets.w3,
    price: 30,
    category: dummyCategories[0],
  ),
  ProductItemModel(
    id: '3',
    name: 'white wristwatch',
    imgUrl:
       AppAssets.w4,
    price: 30,
    category: dummyCategories[0],
  ),
  ProductItemModel(
    id: '3',
    name: 'white wristwatch',
    imgUrl:
       AppAssets.w5,
    price: 30,
    category: dummyCategories[0],
  ),
  ProductItemModel(
    id: '3',
    name: 'white wristwatch',
    imgUrl:
       AppAssets.w6,
    price: 30,
    category: dummyCategories[0],
  ),
  ProductItemModel( 
    id: '3',
    name: 'white wristwatch',
    imgUrl:
       AppAssets.w7,
    price: 30,
    category: dummyCategories[0],
  ),
];
