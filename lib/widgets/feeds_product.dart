import 'dart:io';

import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:ms_ecommerce_app/models%20&%20providers/product.dart';
import 'package:ms_ecommerce_app/screens/inner_screens/product_details_screen.dart';
import 'package:ms_ecommerce_app/widgets/feeds_product_dialog.dart';
import 'package:provider/provider.dart';

class FeedsProduct extends StatefulWidget {
  const FeedsProduct({super.key});

  @override
  FeedsProductState createState() => FeedsProductState();
}

class FeedsProductState extends State<FeedsProduct> {
  @override
  Widget build(BuildContext context) {
    final productAttribute = Provider.of<Product>(context);
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(
          ProductDetailsScreen.routeName,
          arguments: productAttribute.productId,
        );
        // Navigator.of(context).push(MaterialPageRoute(builder: (cxt) {
        //   return ProductDetailsScreen(
        //     productId: productAttribute.id,
        //   );
        // }));
      },
      child: Stack(
        children: [
          Container(
            height: 300,
            decoration: BoxDecoration(
              border: Border.all(
                  width: 2, color: Theme.of(context).colorScheme.onBackground),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      constraints: BoxConstraints(
                          minHeight: Platform.isIOS ? 170 : 140,
                          maxHeight: MediaQuery.of(context).size.height * 0.21),
                      child: Center(
                        child: Image.network(productAttribute.productImage),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    productAttribute.productDescription,
                    maxLines: 1,
                    style: const TextStyle(
                      fontSize: 18,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '\$ ${productAttribute.productPrice.toString()}',
                    maxLines: 1,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Quantity: ${productAttribute.productQuantity.toString()} left',
                        maxLines: 1,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 8,
            right: 10,
            child: IconButton(
              onPressed: () async {
                return showDialog(
                  context: context,
                  builder: (ctx) => FeedsProductDialog(
                    product: productAttribute,
                  ),
                );
              },
              icon: const Icon(Icons.more_horiz),
            ),
          ),
          const badges.Badge(
            // toAnimate: true,
            // animationType: BadgeAnimationType.slide,
            // shape: BadgeShape.square,
            // badgeColor: Colors.deepPurpleAccent,
            // borderRadius: BorderRadius.circular(8),
            badgeContent: Text('New', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}
