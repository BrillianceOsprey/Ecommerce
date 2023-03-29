import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:ms_ecommerce_app/models%20&%20providers/cart.dart';
import 'package:ms_ecommerce_app/models%20&%20providers/product.dart';
import 'package:ms_ecommerce_app/models%20&%20providers/wishlist.dart';
import 'package:ms_ecommerce_app/screens/inner_screens/product_details_screen.dart';
import 'package:provider/provider.dart';

class FeedsProductDialog extends StatefulWidget {
  final Product product;
  const FeedsProductDialog({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  State<FeedsProductDialog> createState() => _FeedsProductDialogState();
}

class _FeedsProductDialogState extends State<FeedsProductDialog> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  addToCartToFirebase() async {
    final User? user = _auth.currentUser;
    final uid = user?.uid ?? '';
    await FirebaseFirestore.instance
        .collection('addToCarts')
        .doc(uid)
        .collection('productLists')
        .doc(widget.product.productId)
        .set({
      // 'createdAt': Timestamp.now(),
      'createdAt': DateTime.now(),
      'userId': uid,
      'productId': widget.product.productId,
      'productTitle': widget.product.productTitle,
      'productPrice': widget.product.productPrice,
      'productDescription': widget.product.productDescription,
      'productCategory': widget.product.productCategory,
      'productImage': widget.product.productImage,
      'productBrand': widget.product.productBrand,
      'productQuantity': widget.product.productQuantity,
      'isFavorite': widget.product.isFavorite,
      'isPopular': widget.product.isPopular,
    });
  }

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
                      widget.product.productId,
                      widget.product.productTitle,
                      widget.product.productImage,
                      widget.product.productPrice,
                    );
                  },
                  icon: wp.wishlistList.containsKey(widget.product.productId)
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
                      widget.product.productId,
                      widget.product.productTitle,
                      widget.product.productImage,
                      widget.product.productPrice,
                    );
                    addToCartToFirebase();
                  },
                  icon: cp.cartList.containsKey(widget.product.productId)
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
                    arguments: widget.product.productId,
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
