import 'package:ecommerce_app/models/product_item_model.dart';
import 'package:ecommerce_app/utils/app_colors.dart';
import 'package:ecommerce_app/views/widgets/counter_widget.dart';
import 'package:flutter/material.dart';

class ProductDetailsPage extends StatefulWidget {
  final ProductItemModel product;
  const ProductDetailsPage({super.key, required this.product});

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary.withOpacity(0.2),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                        if (favProducts.contains(widget.product)) {
                          favProducts.remove(widget.product);
                        } else {
                          favProducts.add(widget.product);
                        }
                      });
            },
            icon: Icon(
              favProducts.contains(widget.product)
                  ? Icons.favorite
                  : Icons.favorite_border,
            ),
            color: Theme.of(context).primaryColor,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(100),
                  bottomRight: Radius.circular(100)),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.primary.withOpacity(0.2),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                    bottom: 30,
                    top: 10,
                    right: 50,
                    left: 50,
                  ),
                  child: Image.asset(
                    widget.product.imgUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.product.name,
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.primary,
                                ),
                          ),
                          Text(
                            widget.product.name,
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge!
                                .copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.primary,
                                ),
                          ),
                        ],
                      ),
                      CounterWidget(),
                    ],
                  ),
                  const SizedBox(height: 30),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // ProductSpecsItem(title: 'Size', value: 'Large'),
                      // SizedBox(height: 30, child: VerticalDivider()),
                      // ProductSpecsItem(title: 'Calories', value: '120 Cal'),
                      // SizedBox(height: 30, child: VerticalDivider()),
                      // ProductSpecsItem(title: 'Cooking', value: '10 mins'),
                    ],
                  ),
                  const SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          '\$${widget.product.price}',
                          style:
                              Theme.of(context).textTheme.titleLarge!.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(context).primaryColor,
                                  ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: SizedBox(
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Theme.of(context).primaryColor,
                              foregroundColor: AppColors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                            ),
                            child: const Text(
                              'Add to cart',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}