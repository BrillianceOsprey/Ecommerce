import 'package:flutter/material.dart';
import 'package:ms_ecommerce_app/core/helpers/logger.dart';

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
  List<Wishlist> wishList = [];

  final Map<String, Wishlist> _wishlistList = {};
  Map<String, Wishlist> get wishlistList => _wishlistList;

  Future<void> fetchWishListProducts() async {}

  void addOrRemoveFromWishlist(
      String pId, String title, String imageUrl, double price) {
    if (_wishlistList.containsKey(pId)) {
      Logger.clap('wishlist f1', pId);
      removeItem(pId);
    } else {
      Logger.clap('wishlist f2', pId);
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
