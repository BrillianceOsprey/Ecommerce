import 'package:flutter/material.dart';
import 'package:ms_ecommerce_app/models%20&%20providers/cart.dart';
import 'package:ms_ecommerce_app/models%20&%20providers/product.dart';
import 'package:ms_ecommerce_app/models%20&%20providers/wishlist.dart';
import 'package:ms_ecommerce_app/screens/inner_screens/product_details_screen.dart';
import 'package:provider/provider.dart';

class FeedsProductDialog extends StatelessWidget {
  final Product product;
  const FeedsProductDialog({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Consumer<WishlistProvider>(builder: (context, wp, _) {
              return CircleAvatar(
                backgroundColor: Colors.deepPurpleAccent,
                child: IconButton(
                  onPressed: () {
                    wp.addOrRemoveFromWishlist(
                      product.productId,
                      product.productTitle,
                      product.productImage,
                      product.productPrice,
                    );
                  },
                  icon: wp.wishlistList.containsKey(product.productId)
                      ? const Icon(
                          Icons.favorite,
                          color: Colors.red,
                        )
                      : const Icon(
                          Icons.favorite,
                          color: Colors.white,
                        ),
                ),
              );
            }),
            Consumer<CartProvider>(builder: (context, cp, _) {
              return CircleAvatar(
                backgroundColor: Colors.deepPurpleAccent,
                child: IconButton(
                  onPressed: () {
                    cp.addToCart(
                      product.productId,
                      product.productTitle,
                      product.productImage,
                      product.productPrice,
                    );
                  },
                  icon: cp.cartList.containsKey(product.productId)
                      ? const Icon(
                          Icons.shopping_cart,
                          color: Colors.red,
                        )
                      : const Icon(
                          Icons.shopping_cart,
                          color: Colors.white,
                        ),
                ),
              );
            }),
            CircleAvatar(
              backgroundColor: Colors.deepPurpleAccent,
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);

                  Navigator.of(context).pushNamed(
                    ProductDetailsScreen.routeName,
                    arguments: product.productId,
                  );
                },
                icon: const Icon(
                  Icons.remove_red_eye,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
