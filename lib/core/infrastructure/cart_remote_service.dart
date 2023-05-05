import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ms_ecommerce_app/core/domain/cart_domain.dart';
import 'package:ms_ecommerce_app/core/helpers/logger.dart';
import 'package:ms_ecommerce_app/models%20&%20providers/cart.dart';
import 'package:provider/provider.dart';

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
  String cartId = DateTime.now().toIso8601String();
  await FirebaseFirestore.instance
      .collection('cart')
      .doc(uid)
      .collection('cartLists')
      .doc(cartId)
      .set({
    // 'createdAt': Timestamp.now(),
    'cartId': cartId,
    'userId': uid,
    'productId': productId,
    'productTitle': productTitle,
    'productPrice': productPrice,
    'productImage': productImage,
    'productQuantity': productQuantity,
  });
}

Stream<List<CartDomain>> fetchCarts() {
  Logger.clap('cartList cart', 'called');
  return FirebaseFirestore.instance
      .collection('cart')
      .doc('QgTKLzemLJWBw6wlUnF31d2o5H42')
      .collection('cartLists')
      .snapshots()
      .map((event) {
    Logger.clap('cartList cart', event);
    Logger.clap('cartList cart', event.docs);
    List<CartDomain> cartList = [];

    for (var data in event.docs) {
      cartList.add(CartDomain.fromJson(data.data()));
    }
    return cartList;
  });
}
