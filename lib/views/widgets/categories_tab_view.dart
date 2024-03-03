import 'package:ecommerce_app/models/category.dart';
import 'package:ecommerce_app/models/product_item_model.dart';
import 'package:ecommerce_app/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CategoriesTabView extends StatefulWidget {
  const CategoriesTabView({super.key});

  @override
  State<CategoriesTabView> createState() => _CategoriesTabViewState();
}

class _CategoriesTabViewState extends State<CategoriesTabView> {
  String? selectedCategoryId;
  late List<ProductItemModel> filteredProducts;

  @override
  void initState() {
    super.initState();
    filteredProducts = dummyProducts;
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: dummyCategories.length,
        itemBuilder: (context, index) {
          final dummyCategory = dummyCategories[index];
          return InkWell(
            onTap: () {
              setState(() {
                if (selectedCategoryId != null &&
                    selectedCategoryId == dummyCategory.id) {
                  selectedCategoryId = null;
                  filteredProducts = dummyProducts;
                } else {
                  selectedCategoryId = dummyCategory.id;
                  filteredProducts = dummyProducts
                      .where((product) =>
                          product.category.id == selectedCategoryId)
                      .toList();
                }
              });
            },
            child: Card(
              color: selectedCategoryId == dummyCategory.id
                  ? AppColors.primary
                  : null,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      dummyCategory.imgUrl,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Text(
                      dummyCategory.title,
                      style: TextStyle(
                        color: selectedCategoryId == dummyCategory.id
                            ? Theme.of(context).canvasColor
                            : AppColors.primary,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
          // return Card(
          //   child: Padding(
          //     padding: const EdgeInsets.all(16.0),
          //     child: ListTile(
          //       onTap: () {
          //         Navigator.of(context).push(
          //           MaterialPageRoute(
          //             builder: (context) => HomePage(),
          //           ),
          //         ).then((value) => setState(() {}));
          //       },
          //       leading: Image.asset(
          //         favProducts[index].imgUrl,
          //         height: 50,
          //         width: 50,
          //         fit: BoxFit.fill,
          //       ),
          //       title: Text(
          //         favProducts[index].name,
          //         style: Theme.of(context).textTheme.titleMedium!.copyWith(
          //               fontWeight: FontWeight.bold,
          //             ),
          //       ),
          //       subtitle: Text(
          //         '${favProducts[index].category.title} - \$${favProducts[index].price}',
          //         style: Theme.of(context).textTheme.labelLarge!.copyWith(
          //               fontWeight: FontWeight.normal,
          //             ),
          //       ),
          //       trailing: orientation == Orientation.portrait
          //           ? IconButton(
          //               onPressed: () {
          //                 setState(() {
          //                   favProducts.remove(favProducts[index]);
          //                 });
          //               },
          //               icon: const Icon(Icons.favorite),
          //               color: Theme.of(context).primaryColor,
          //             )
          //           : TextButton.icon(
          //               onPressed: () {
          //                 setState(() {
          //                   favProducts.remove(favProducts[index]);
          //                 });
          //               },
          //               icon: const Icon(Icons.favorite),
          //               label: const Text('Favorite'),
          //             ),
          //     ),
          //   ),
          // );
        });
  }
}
