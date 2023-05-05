import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ms_ecommerce_app/core/helpers/logger.dart';

class Cart with ChangeNotifier {
  final String cartId;
  final String productId;
  final String title;
  final String imageUrl;
  final double price;
  final int quantity;

  Cart({
    required this.cartId,
    required this.productId,
    required this.title,
    required this.imageUrl,
    required this.price,
    required this.quantity,
  });
}

class CartProvider with ChangeNotifier {
  final Map<String, Cart> _cartList = {};
  Map<String, Cart> get cartList => _cartList;
  List<Cart> _cartListfb = [];

  double get totalAmount {
    double total = 0.0;
    _cartList.forEach((key, value) {
      total += value.quantity * value.price;
    });
    return total;
  }

  List<Cart> carts() => _cartListfb;
  Future<void> fetchCarts() async {
    await FirebaseFirestore.instance
        .collection('cart')
        .get()
        .then((QuerySnapshot productSnapshot) {
      _cartListfb = [];
      for (var element in productSnapshot.docs) {
        // var parseDatee = DateTime.parse(element['createdAt']);
        _cartListfb.insert(
          0,
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
  }

  void addToCart(String pId, String title, String imageUrl, double price) {
    print('product detail in Function() id  $pId');
    // print('product detail in Function() title  $title');
    // print('product detail in Function() image  $imageUrl');
    // print('product detail in Function() price   $price');
    if (_cartList.containsKey(pId)) {
      Logger.clap('product detail in function() pId', pId);
      _cartList.update(
        pId,
        (value) => Cart(
          cartId: value.cartId,
          productId: value.productId,
          title: value.title,
          imageUrl: value.imageUrl,
          price: value.price,
          quantity: value.quantity + 1,
        ),
      );
    } else {
      Logger.clap('product detail in function() else pId', pId);
      _cartList.putIfAbsent(
        pId,
        () => Cart(
          cartId: DateTime.now().toIso8601String(),
          productId: pId,
          title: title,
          imageUrl: imageUrl,
          price: price,
          quantity: 1,
        ),
      );
    }
    notifyListeners();
  }

  void decrementCartProductQuantity(
      String pId, String title, String imageUrl, double price) {
    if (_cartList.containsKey(pId)) {
      _cartList.update(
          pId,
          (value) => Cart(
                cartId: value.cartId,
                productId: value.productId,
                title: value.title,
                imageUrl: value.imageUrl,
                price: value.price,
                quantity: value.quantity - 1,
              ));
    }
    notifyListeners();
  }

  void removeItem(String pId) {
    _cartList.remove(pId);
    notifyListeners();
  }

  void clearCart() {
    _cartList.clear();
    notifyListeners();
  }
}
