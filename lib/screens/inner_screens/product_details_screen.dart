import 'package:badges/badges.dart' as badges;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ms_ecommerce_app/core/helpers/logger.dart';
import 'package:provider/provider.dart';

import '../../core/infrastructure/cart_remote_service.dart';
import '../../models & providers/cart.dart';
import '../../models & providers/product.dart';
import '../../models & providers/wishlist.dart';
import '../../widgets/feeds_product.dart';
import '../cart/cart_screen.dart';
import '../wishlist/wishlist_screen.dart';

class ProductDetailsScreen extends StatefulWidget {
  static const routeName = '/product-details-screen';
  final String? productId;
  const ProductDetailsScreen({Key? key, this.productId}) : super(key: key);

  @override
  ProductDetailsScreenState createState() => ProductDetailsScreenState();
}

class ProductDetailsScreenState extends State<ProductDetailsScreen> {
  GlobalKey previewContainer = GlobalKey();
  // ProductProvider productProvider = ProductProvider();
  // CartProvider cartProvider = CartProvider();
  // WishlistProvider wishlistProvider = WishlistProvider();
  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    final cartProvider = Provider.of<CartProvider>(context);
    final wishlistProvider = Provider.of<WishlistProvider>(context);
    final productId = ModalRoute.of(context)!.settings.arguments as String;
    List<Product> productsList = productProvider.products();
    final product = productProvider.getById(productId);

    return Scaffold(
      bottomSheet: BottomSheet(
        cartProvider: cartProvider,
        product: product,
        productId: productId,
        wishlistProvider: wishlistProvider,
      ),
      appBar: AppBar(
        title: const Text('Details'),
        actions: [
          Consumer<WishlistProvider>(builder: (context, wp, _) {
            return badges.Badge(
              // toAnimate: true,
              // animationType: BadgeAnimationType.slide,
              // position: BadgePosition.topEnd(top: 5, end: 7),
              badgeContent: Text(
                wp.wishlistList.length.toString(),
                style: const TextStyle(color: Colors.white),
              ),
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(WishlistScreen.routeName);
                },
                icon: const Icon(Icons.favorite),
              ),
            );
          }),
          Consumer<CartProvider>(builder: (context, cp, _) {
            return badges.Badge(
              // toAnimate: true,
              // animationType: BadgeAnimationType.slide,
              // position: BadgePosition.topEnd(top: 5, end: 7),
              badgeContent: Text(
                cp.cartList.length.toString(),
                style: const TextStyle(color: Colors.white),
              ),
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(CartScreen.routeName);
                },
                icon: const Icon(Icons.shopping_cart),
              ),
            );
          }),
          const SizedBox(
            width: 30,
          )
        ],
      ),
      body: Stack(
        children: [
          Container(
            foregroundDecoration: const BoxDecoration(color: Colors.black12),
            height: MediaQuery.of(context).size.height * 0.45,
            width: double.infinity,
            child: Image.network(product.productImage),
          ),
          SingleChildScrollView(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 300),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.save),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.share),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.9,
                              child: Text(
                                product.productTitle,
                                style: const TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              '\$ ${product.productPrice}',
                              style: const TextStyle(
                                fontSize: 21,
                                color: Colors.purple,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 3),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        child: Divider(
                          thickness: 1,
                          color: Colors.grey,
                          height: 1,
                        ),
                      ),
                      const SizedBox(height: 3),
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Text(
                          product.productDescription,
                          style: const TextStyle(
                            fontSize: 21,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const SizedBox(height: 3),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        child: Divider(
                          thickness: 1,
                          color: Colors.grey,
                          height: 1,
                        ),
                      ),
                      ContentRow(
                        title: 'Brand',
                        nameTitle: product.productBrand,
                      ),
                      ContentRow(
                        title: 'Quantity',
                        nameTitle: '${product.productQuantity.toString()} left',
                      ),
                      ContentRow(
                        title: 'Category',
                        nameTitle: product.productCategory,
                      ),
                      ContentRow(
                        title: 'Popularity',
                        nameTitle: product.isPopular ? 'Popular' : 'Barely',
                      ),
                      const SizedBox(height: 15),
                      const Divider(
                        thickness: 1,
                        color: Colors.grey,
                        height: 1,
                      ),
                      Container(
                        color: Colors.black54,
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [
                            SizedBox(height: 10),
                            Padding(
                              padding: EdgeInsets.all(8),
                              child: Text(
                                'No reviews yet',
                                style: TextStyle(
                                  fontSize: 21,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8),
                              child: Text(
                                'Be The First To Review!',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                            SizedBox(height: 70),
                            Divider(
                              thickness: 1,
                              color: Colors.grey,
                              height: 1,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(8),
                  child: const Text(
                    'Suggested Product: ',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 30),
                  width: double.infinity,
                  height: 300,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount:
                        productsList.length < 7 ? productsList.length : 7,
                    itemBuilder: (ctx, i) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          width: 200,
                          child: ChangeNotifierProvider.value(
                            value: productsList[i],
                            child: const FeedsProduct(),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ContentRow extends StatelessWidget {
  final String title;
  final String nameTitle;
  const ContentRow({
    required this.title,
    required this.nameTitle,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15, left: 16, right: 16),
      child: Row(
        children: [
          Text(
            '$title: ',
            style: const TextStyle(
              fontSize: 21,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            nameTitle,
            style: const TextStyle(
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}

class BottomSheet extends StatefulWidget {
  final String productId;
  final Product product;
  final CartProvider cartProvider;
  final WishlistProvider wishlistProvider;

  const BottomSheet({
    Key? key,
    required this.cartProvider,
    required this.product,
    required this.productId,
    required this.wishlistProvider,
  }) : super(key: key);

  @override
  State<BottomSheet> createState() => _BottomSheetState();
}

class _BottomSheetState extends State<BottomSheet> {
  CartRemoteService cartRemoteService = CartRemoteService();
  // final FirebaseAuth _auth = FirebaseAuth.instance;
  // addToCartToFirebase() async {
  //   final User? user = _auth.currentUser;
  //   final uid = user?.uid ?? '';
  //   String cartId = DateTime.now().toIso8601String();
  //   await FirebaseFirestore.instance
  //       .collection('cart')
  //       .doc(uid)
  //       .collection('cartLists')
  //       .doc(cartId)
  //       .set({
  //     // 'createdAt': Timestamp.now(),
  //     'cartId': cartId,
  //     'userId': uid,
  //     'productId': widget.product.productId,
  //     'productTitle': widget.product.productTitle,
  //     'productPrice': widget.product.productPrice,
  //     'productImage': widget.product.productImage,
  //     'productQuantity': widget.product.productQuantity,
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    Logger.w('product detail in function()', widget.product.productId);
    // Logger.w('product detail in function() detail id', widget.productId);
    Logger.w('product detail in function() detail provider',
        widget.cartProvider.cartList.containsKey(widget.product.productId));
    // Logger.w('product detail in function() detail provider',
    //     widget.cartProvider.cartList);

    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Container(
            color: Colors.pinkAccent,
            height: 50,
            child: Center(child: Consumer<CartProvider>(builder: (cxt, cp, _) {
              return TextButton(
                onPressed: () {
                  cartRemoteService.addToCartToFirebase(
                    context,
                    productId: widget.productId,
                    productTitle: widget.product.productTitle,
                    productPrice: widget.product.productPrice.toString(),
                    productImage: widget.product.productImage,
                    productQuantity: widget.product.productQuantity.toString(),
                  );
                  cp.addToCart(
                    widget.productId,
                    widget.product.productTitle,
                    widget.product.productImage,
                    widget.product.productPrice,
                  );
                },
                // widget.cartProvider.cartList.containsKey(widget.productId)
                //     ? () {
                //         // print(cartProvider.cartList.containsKey(productId));
                //         // cartProvider.addToCart(
                //         //   productId,
                //         //   product.title,
                //         //   product.imageUrl,
                //         //   product.price,
                //         // );
                //       }
                //     : () {
                //         setState(() {
                //           // print(widget.cartProvider.cartList
                //           //     .containsKey(widget.productId));
                //           Logger.i(
                //               'product detail in function() add to cart',
                //               widget.cartProvider.cartList
                //                   .containsKey(widget.productId));
                //           widget.cartProvider.addToCart(
                //             widget.productId,
                //             widget.product.title,
                //             widget.product.imageUrl,
                //             widget.product.price,
                //           );
                //         });
                //       },
                child: Text(
                  cp.cartList.containsKey(widget.productId)
                      ? 'IN CART'
                      : 'ADD TO CART',
                  style: const TextStyle(fontSize: 18, color: Colors.white),
                ),
              );
            })),
          ),
        ),
        Expanded(
          flex: 2,
          child: Container(
            color: Colors.white,
            height: 50,
            child: Center(
              child: TextButton(
                onPressed: () {},
                child: const Text(
                  'BUY NOW',
                  style: TextStyle(fontSize: 18, color: Colors.black),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            color: Colors.grey.withOpacity(0.2),
            height: 50,
            child: Center(
              child: Consumer<WishlistProvider>(
                builder: (cxt, wp, _) {
                  return IconButton(
                    onPressed: () {
                      Logger.i('wishlist',
                          wp.wishlistList.containsKey(widget.productId));
                      wp.addOrRemoveFromWishlist(
                        widget.productId,
                        widget.product.productTitle,
                        widget.product.productImage,
                        widget.product.productPrice,
                      );
                    },
                    icon: wp.wishlistList.containsKey(widget.productId)
                        ? const Icon(
                            Icons.favorite,
                            color: Colors.red,
                          )
                        : const Icon(Icons.favorite_border),
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
