import 'package:flutter/material.dart';

class Wishlist with ChangeNotifier {
  final String cartId;
  final String title;
  final String imageUrl;
  final double price;

  Wishlist({
    required this.cartId,
    required this.title,
    required this.imageUrl,
    required this.price,
  });
}

class WishlistProvider with ChangeNotifier {
  final Map<String, Wishlist> _wishlistList = {};
  Map<String, Wishlist> get wishlistList => _wishlistList;

  void addOrRemoveFromWishlist(
      String pId, String title, String imageUrl, double price) {
    if (_wishlistList.containsKey(pId)) {
      removeItem(pId);
    } else {
      _wishlistList.putIfAbsent(
        pId,
        () => Wishlist(
          cartId: DateTime.now().toIso8601String(),
          title: title,
          imageUrl: imageUrl,
          price: price,
        ),
      );
    }
    notifyListeners();
  }

  void removeItem(String pId) {
    _wishlistList.remove(pId);
    notifyListeners();
  }

  void clearCart() {
    _wishlistList.clear();
    notifyListeners();
  }
}
