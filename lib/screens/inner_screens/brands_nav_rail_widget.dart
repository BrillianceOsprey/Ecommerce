// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:ms_ecommerce_app/screens/inner_screens/product_details_screen.dart';
import 'package:provider/provider.dart';

import '../../models & providers/product.dart';

class BrandNavRailWidget extends StatelessWidget {
  const BrandNavRailWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productAttribute = Provider.of<Product>(context, listen: false);

    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(
          ProductDetailsScreen.routeName,
          arguments: productAttribute.id,
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 300,
          width: 250,
          decoration: BoxDecoration(
            border: Border.all(
                width: 2, color: Theme.of(context).colorScheme.onBackground),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  SizedBox(
                    height: 190,
                    width: double.infinity,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(12),
                      ),
                      child: Image.network(
                        productAttribute.imageUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  // Positioned(
                  //   top: 12,
                  //   right: 12,
                  //   child: IconButton(
                  //     onPressed: () {},
                  //     icon: Icon(Icons.favorite),
                  //   ),
                  // ),
                  Positioned(
                    bottom: 12,
                    right: 12,
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text(
                          '\$ ${productAttribute.price}',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  ' ${productAttribute.title}',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 20),
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Text(
                        ' ${productAttribute.productCategoryName} ',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontSize: 20),
                      ),
                    ),
                    // InkWell(
                    //   onTap: () {},
                    //   child: Icon(Icons.add_shopping_cart),
                    // ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
