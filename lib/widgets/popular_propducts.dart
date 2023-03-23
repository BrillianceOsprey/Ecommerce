import 'package:flutter/material.dart';
import 'package:ms_ecommerce_app/models%20&%20providers/cart.dart';
import 'package:ms_ecommerce_app/models%20&%20providers/product.dart';
import 'package:ms_ecommerce_app/models%20&%20providers/wishlist.dart';
import 'package:ms_ecommerce_app/screens/inner_screens/product_details_screen.dart';
import 'package:provider/provider.dart';

class PopularProducts extends StatelessWidget {
  const PopularProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productAttrribute = Provider.of<Product>(context);
    final cartProvider = Provider.of<CartProvider>(context);

    return Padding(
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
                  width: 250,
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed(
                        ProductDetailsScreen.routeName,
                        arguments: productAttrribute.id,
                      );
                    },
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(12),
                      ),
                      child: Image.network(
                        productAttrribute.imageUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Consumer<WishlistProvider>(builder: (context, wp, _) {
                  return Positioned(
                    top: 12,
                    right: 12,
                    child: IconButton(
                      onPressed: () {
                        wp.addOrRemoveFromWishlist(
                          productAttrribute.id,
                          productAttrribute.title,
                          productAttrribute.imageUrl,
                          productAttrribute.price,
                        );
                      },
                      icon: wp.wishlistList.containsKey(productAttrribute.id)
                          ? const Icon(Icons.favorite, color: Colors.red)
                          : const Icon(
                              Icons.favorite,
                              color: Colors.white,
                            ),
                    ),
                  );
                }),
                Positioned(
                  bottom: 12,
                  right: 12,
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text(
                        '\$ ${productAttrribute.price}',
                        style: const TextStyle(fontSize: 16),
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
                ' ${productAttrribute.title}',
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
                      ' ${productAttrribute.description} ',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontSize: 18),
                    ),
                  ),
                  InkWell(
                    onTap:
                        cartProvider.cartList.containsKey(productAttrribute.id)
                            ? () {}
                            : () {
                                cartProvider.addToCart(
                                  productAttrribute.id,
                                  productAttrribute.title,
                                  productAttrribute.imageUrl,
                                  productAttrribute.price,
                                );
                              },
                    child:
                        cartProvider.cartList.containsKey(productAttrribute.id)
                            ? const Icon(Icons.check)
                            : const Icon(Icons.add_shopping_cart),
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
