//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/models/product_item_model.dart';
import 'package:ecommerce_app/utils/app_colors.dart';
import 'package:flutter/material.dart';

import '../widgets/counter_widget.dart';

class ProductDetailsPage extends StatefulWidget {
  // final Product product;
  final ProductItemModel product;
  const ProductDetailsPage({Key? key, required this.product}) : super(key: key);
  // const ProductDetailsPage({super.key});

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  ProductSize? selectedSize;

  @override
  Widget build(BuildContext context) {
    final product =
        ModalRoute.of(context)!.settings.arguments as ProductItemModel;
    final size = MediaQuery.of(context).size;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(product.name),
        backgroundColor: AppColors.transparent,
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.favorite_border_rounded)),
        ],
      ),
      body: SafeArea(
        top: false,
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: size.height * 0.6,
              // padding: EdgeInsets.only(top: size.height * 0.09),
              decoration: BoxDecoration(
                color: AppColors.grey2,
              ),
              child: Image.asset(
                product.imgUrl,
                fit: BoxFit.contain,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: size.height * 0.5),
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(50)),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                product.name,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.star,
                                    color: AppColors.orange,
                                  ),
                                  const SizedBox(width: 6),
                                  Text(
                                    product.averageRate.toString(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelLarge!
                                        .copyWith(
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          CounterWidget(),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Size',
                        style:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: ProductSize.values
                            .map(
                              (size) => Padding(
                                padding:
                                    const EdgeInsetsDirectional.only(end: 8),
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      selectedSize = size;
                                    });
                                  },
                                  child: CircleAvatar(
                                    radius: 23,
                                    backgroundColor: selectedSize == size
                                        ? Theme.of(context).primaryColor
                                        : AppColors.grey2,
                                    child: Center(
                                      child: Text(
                                        size.name,
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelMedium!
                                            .copyWith(
                                              fontWeight: FontWeight.bold,
                                              color: selectedSize == size
                                                  ? AppColors.white
                                                  : null,
                                            ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Details',
                        style:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        product.description,
                        style: Theme.of(context).textTheme.labelLarge!.copyWith(
                              color: AppColors.grey,
                            ),
                      ),
                      const Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '\$${product.price}',
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.primary,
                                ),
                          ),
                          SizedBox(
                            height: 50,
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.primary,
                                foregroundColor: AppColors.white,
                              ),
                              child: const Text('Add to Order'),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// class _ProductDetailsPageState extends State<ProductDetailsPage> {
//   @override
//   Widget build(BuildContext context) {
//     final product = ModalRoute.of(context)!.settings.arguments as ProductItemModel;

//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: AppColors.grey2,
//         actions: [
//           IconButton(
//             onPressed: () {
//               setState(() {
//                 if (favProducts.contains(product)) {
//                   favProducts.remove(product);
//                 } else {
//                   favProducts.add(product);
//                 }
//               });
//             },
//             icon: Icon(
//               favProducts.contains(product)
//                   ? Icons.favorite
//                   : Icons.favorite_border,
//             ),
//           ),
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Container(
//               width: double.infinity,
//               decoration: BoxDecoration(
//                 color: AppColors.grey2,
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.all(
//                   50,
//                 ),
//                 child: Image.network(
//                   product.imgUrl,
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//             const SizedBox(height: 16),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16.0),
//               child: Column(
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             product.name,
//                             style: Theme.of(context)
//                                 .textTheme
//                                 .titleLarge!
//                                 .copyWith(
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                           ),
//                           const SizedBox(height: 6),
//                           Text(
//                             product.category.title,
//                             style: Theme.of(context)
//                                 .textTheme
//                                 .titleMedium!
//                                 .copyWith(
//                                   color: AppColors.grey,
//                                 ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 24),
//                   const Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       ProductSpecsItem(title: 'Size', value: 'Large'),
//                       SizedBox(height: 30, child: VerticalDivider()),
//                       ProductSpecsItem(title: 'Calories', value: '120 Cal'),
//                       SizedBox(height: 30, child: VerticalDivider()),
//                       ProductSpecsItem(title: 'Cooking', value: '10 mins'),
//                     ],
//                   ),
//                   const SizedBox(height: 16),
//                   Text(
//                     product.description,
//                     style: Theme.of(context).textTheme.bodyMedium!.copyWith(
//                           color: AppColors.grey,
//                         ),
//                   ),
//                   const SizedBox(height: 24),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Expanded(
//                         child: Text(
//                           '\$${product.price}',
//                           style:
//                               Theme.of(context).textTheme.titleLarge!.copyWith(
//                                     fontWeight: FontWeight.bold,
//                                     color: Theme.of(context).primaryColor,
//                                   ),
//                         ),
//                       ),
//                       Expanded(
//                         flex: 2,
//                         child: SizedBox(
//                           height: 50,
//                           child: ElevatedButton(
//                             onPressed: () {},
//                             style: ElevatedButton.styleFrom(
//                               backgroundColor: Theme.of(context).primaryColor,
//                               foregroundColor: AppColors.white,
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(16),
//                               ),
//                             ),
//                             child: const Text('Add to cart'),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
