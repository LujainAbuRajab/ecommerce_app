//import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/models/product_item_model.dart';
import 'package:ecommerce_app/utils/app_colors.dart';
import 'package:flutter/material.dart';

class ProductItem extends StatefulWidget {
  final ProductItemModel productItem;
  const ProductItem({super.key, required this.productItem});

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Stack(
            children: [
              Container(
                height: 130,
                width: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.0),
                  color: AppColors.grey2,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    widget.productItem.imgUrl,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Positioned(
                top: 8.0,
                right: 8.0,
                child: DecoratedBox(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white54,
                  ),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        if (favProducts.contains(widget.productItem)) {
                          favProducts.remove(widget.productItem);
                        } else {
                          favProducts.add(widget.productItem);
                        }
                      });
                    },
                    child: DecoratedBox(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Icon(
                          favProducts.contains(widget.productItem)
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 4.0),
        Text(
          widget.productItem.name,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                fontWeight: FontWeight.w600,
              ),
        ),
        Text(
          widget.productItem.category.title,
          style: Theme.of(context).textTheme.labelMedium!.copyWith(
                color: Colors.grey,
              ),
        ),
        Text(
          '\$${widget.productItem.price}',
          style: Theme.of(context).textTheme.titleSmall!.copyWith(
                fontWeight: FontWeight.w600,
              ),
        ),
      ],
    );
  }
}
