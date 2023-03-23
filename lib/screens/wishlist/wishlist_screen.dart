import 'package:flutter/material.dart';
import 'package:ms_ecommerce_app/models%20&%20providers/wishlist.dart';
import 'package:ms_ecommerce_app/services/global_methods.dart';
import 'package:provider/provider.dart';

import 'empty_wishlist.dart';
import 'full_wishlist.dart';

class WishlistScreen extends StatelessWidget {
  static const routeName = '/wishlist-screen';

  const WishlistScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final wishlistProvider = Provider.of<WishlistProvider>(context);
    GlobalMethods globalMethods = GlobalMethods();

    return wishlistProvider.wishlistList.isEmpty
        ? const Scaffold(
            body: EmptyWishlist(),
          )
        : Scaffold(
            appBar: AppBar(
              title: Text('Wishlist (${wishlistProvider.wishlistList.length})'),
              actions: [
                IconButton(
                  onPressed: () async {
                    await globalMethods.showDialogue(
                      context,
                      () => wishlistProvider.clearCart(),
                    );
                  },
                  icon: const Icon(Icons.delete),
                ),
              ],
            ),
            body: ListView.builder(
              itemCount: wishlistProvider.wishlistList.length,
              itemBuilder: (ctx, i) {
                return ChangeNotifierProvider.value(
                  value: wishlistProvider.wishlistList.values.toList()[i],
                  child: FullWishlist(
                    pId: wishlistProvider.wishlistList.keys.toList()[i],
                  ),
                );
              },
            ),
          );
  }
}
