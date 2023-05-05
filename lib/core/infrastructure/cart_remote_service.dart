import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ms_ecommerce_app/models%20&%20providers/cart.dart';
import 'package:provider/provider.dart';

import '../../models & providers/product.dart';

class CartRemoteService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  addToCartToFirebase(
    BuildContext context, {
    required String productId,
    required String productTitle,
    required String productPrice,
    required String productImage,
    required String productQuantity,
  }) async {
    final User? user = _auth.currentUser;
    final uid = user?.uid ?? '';
    // String cartId = DateTime.now().toIso8601String();
    await FirebaseFirestore.instance
        .collection('cart')
        .doc(uid)
        .collection('cartLists')
        .doc(productId)
        .set({
      // 'createdAt': Timestamp.now(),
      'cartId': productId,
      'userId': uid,
      'productId': productId,
      'productTitle': productTitle,
      'productPrice': productPrice,
      'productImage': productImage,
      'productQuantity': productQuantity,
    });
  }

  Future<List<Cart>> fetchCarts(BuildContext context) async {
    final cartProvider = Provider.of<CartProvider>(context);
    List<Cart> cartList = [];
    await FirebaseFirestore.instance
        .collection('cart')
        .get()
        .then((QuerySnapshot productSnapshot) {
      for (var element in productSnapshot.docs) {
        // var parseDatee = DateTime.parse(element['createdAt']);
        cartList.insert(
          0,
          // Cart(
          //   createdAt: element.get('createdAt').toString(),
          //   productId: element.get('productId'),
          //   productTitle: element.get('productTitle'),
          //   productBrand: element.get('productBrand'),
          //   productDescription: element.get('productDescription'),
          //   productImage: element.get('productImage'),
          //   productPrice: double.parse(element.get('productPrice')),
          //   productCategory: element.get('productCategory'),
          //   productQuantity: int.parse(element.get('productQuantity')),
          //   isFavorite: element.get('isFavorite'),
          //   isPopular: element.get('isPopular'),
          // ),
          Cart(
            cartId: element.get('cartId'),
            productId: element.get('productId'),
            title: element.get('productTitle'),
            imageUrl: element.get('productImage'),
            price: element.get('productPrice'),
            quantity: element.get('productQuantity'),
          ),
        );
        // _products.sort((a, b) => a.createdAt!.compareTo(b.createdAt!));
      }
    });

    return cartList;
  }
}
