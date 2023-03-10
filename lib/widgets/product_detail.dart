// import 'dart:ui';
// import 'package:ECommerceApp/consts/colors.dart';
// import 'package:ECommerceApp/consts/my_icons.dart';
// import 'package:ECommerceApp/provider/cart_provider.dart';
// import 'package:ECommerceApp/provider/dark_theme_provider.dart';
// import 'package:ECommerceApp/provider/favs_provider.dart';
// import 'package:ECommerceApp/provider/products.dart';
// import 'package:ECommerceApp/screens/cart.dart';
// import 'package:ECommerceApp/screens/wishlist.dart';
// import 'package:ECommerceApp/widget/feeds_products.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/darttheme_provider.dart';
import 'feeds_product.dart';

class ProductDetails extends StatefulWidget {
  static const routeName = '/ProductDetails';

  const ProductDetails({super.key});

  @override
  ProductDetailsState createState() => ProductDetailsState();
}

class ProductDetailsState extends State<ProductDetails> {
  GlobalKey previewContainer = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);
    // final productsData = Provider.of<Products>(context, listen: false);
    final productId = ModalRoute.of(context)?.settings.arguments as String;
    // final cartProvider = Provider.of<CartProvider>(context);

    // final favsProvider = Provider.of<FavsProvider>(context);
    print('productId $productId');
    // final prodAttr = productsData.findById(productId);
    // final productsList = productsData.products;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            foregroundDecoration: const BoxDecoration(color: Colors.black12),
            height: MediaQuery.of(context).size.height * 0.45,
            width: double.infinity,
            child: Image.network(
                // prodAttr.imageUrl,
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS4PdHtXka2-bDDww6Nuect3Mt9IwpE4v4HNw&usqp=CAU'),
          ),
          SingleChildScrollView(
            padding: const EdgeInsets.only(top: 16.0, bottom: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(height: 250),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Material(
                        color: Colors.transparent,
                        child: InkWell(
                          splashColor: Colors.purple.shade200,
                          onTap: () {},
                          borderRadius: BorderRadius.circular(30),
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.save,
                              size: 23,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Material(
                        color: Colors.transparent,
                        child: InkWell(
                          splashColor: Colors.purple.shade200,
                          onTap: () {},
                          borderRadius: BorderRadius.circular(30),
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.share,
                              size: 23,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  //padding: const EdgeInsets.all(16.0),
                  color: Theme.of(context).scaffoldBackgroundColor,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.9,
                              child: const Text(
                                // prodAttr.title,
                                'Hello test',
                                maxLines: 2,
                                style: TextStyle(
                                  // color: Theme.of(context).textSelectionColor,
                                  fontSize: 28.0,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            const Text(
                              // 'US \$ ${prodAttr.price}',
                              'Hello test',
                              style: TextStyle(
                                  // color: themeState.darkTheme
                                  //     ? Theme.of(context).disabledColor
                                  //     : ColorsConsts.subTitle,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 21.0),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 3.0),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Divider(
                          thickness: 1,
                          color: Colors.grey,
                          height: 1,
                        ),
                      ),
                      const SizedBox(height: 5.0),
                      const Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Text(
                          // prodAttr.description,
                          "Hello test",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 21.0,
                            // color: themeState.darkTheme
                            //     ? Theme.of(context).disabledColor
                            //     : ColorsConsts.subTitle,
                          ),
                        ),
                      ),
                      const SizedBox(height: 5.0),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Divider(
                          thickness: 1,
                          color: Colors.grey,
                          height: 1,
                        ),
                      ),
                      // _details(themeState.darkTheme, 'Brand: ', prodAttr.brand),
                      // _details(themeState.darkTheme, 'Quantity: ',
                      //     '${prodAttr.quantity}'),
                      // _details(themeState.darkTheme, 'Category: ',
                      //     prodAttr.productCategoryName),
                      // _details(themeState.darkTheme, 'Popularity: ',
                      //     prodAttr.isPopular ? 'Popular' : 'Barely known'),
                      const SizedBox(
                        height: 15,
                      ),
                      const Divider(
                        thickness: 1,
                        color: Colors.grey,
                        height: 1,
                      ),

                      // const SizedBox(height: 15.0),
                      Container(
                        color: Theme.of(context).backgroundColor,
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [
                            SizedBox(height: 10.0),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'No reviews yet',
                                style: TextStyle(
                                    // color: Theme.of(context).textSelectionColor,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 21.0),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(2.0),
                              child: Text(
                                'Be the first review!',
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 20.0,
                                  // color: themeState.darkTheme
                                  //     ? Theme.of(context).disabledColor
                                  //     : ColorsConsts.subTitle,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 70,
                            ),
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
                // const SizedBox(height: 15.0),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(8.0),
                  color: Theme.of(context).scaffoldBackgroundColor,
                  child: const Text(
                    'Suggested products:',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 30),
                  width: double.infinity,
                  height: 340,
                  child: ListView.builder(
                    itemCount: 7,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext ctx, int index) {
                      return const FeedProducts();
                      //  ChangeNotifierProvider.value(
                      //     value: productsList[index], child:
                      //      FeedProducts());
                    },
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                centerTitle: true,
                title: const Text(
                  "DETAIL",
                  style:
                      TextStyle(fontSize: 16.0, fontWeight: FontWeight.normal),
                ),
                actions: <Widget>[
                  IconButton(
                    icon: const Icon(
                      Icons.car_crash,
                      // color: ColorCon.favColor,
                    ),
                    onPressed: () {
                      // Navigator.of(context).pushNamed(WishlistScreen.routeName);
                    },
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.card_travel,
                      color: Colors.red,
                    ),
                    onPressed: () {
                      // Navigator.of(context).pushNamed(CartScreen.routeName);
                    },
                  ),
                ]),
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: Row(children: [
                Expanded(
                  flex: 3,
                  child: Container(
                    height: 50,
                    color: Colors.amber,
                    // child: RaisedButton(
                    //   materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    //   shape: RoundedRectangleBorder(side: BorderSide.none),
                    //   color: Colors.redAccent.shade400,
                    //   onPressed:
                    //       cartProvider.getCartItems.containsKey(productId)
                    //           ? () {}
                    //           : () {
                    //               cartProvider.addProductToCart(
                    //                   productId,
                    //                   prodAttr.price,
                    //                   prodAttr.title,
                    //                   prodAttr.imageUrl);
                    //             },
                    //   child: Text(
                    //     cartProvider.getCartItems.containsKey(productId)
                    //         ? 'In cart'
                    //         : 'Add to Cart'.toUpperCase(),
                    //     style: TextStyle(fontSize: 16, color: Colors.white),
                    //   ),
                    // ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    height: 50,
                    // child: RaisedButton(
                    //   materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    //   shape: RoundedRectangleBorder(side: BorderSide.none),
                    //   color: Theme.of(context).backgroundColor,
                    //   onPressed: () {},
                    //   child: Row(
                    //     children: [
                    //       Text(
                    //         'Buy now'.toUpperCase(),
                    //         style: TextStyle(
                    //             fontSize: 14,
                    //             color: Theme.of(context).textSelectionColor),
                    //       ),
                    //       SizedBox(
                    //         width: 5,
                    //       ),
                    //       Icon(
                    //         Icons.payment,
                    //         color: Colors.green.shade700,
                    //         size: 19,
                    //       ),
                    //     ],
                    //   ),
                    // ),
                  ),
                ),
                // Expanded(
                //   flex: 1,
                //   child: Container(
                //     color: themeState.darkTheme
                //         ? Theme.of(context).disabledColor
                //         : ColorsConsts.subTitle,
                //     height: 50,
                //     child: InkWell(
                //       splashColor: ColorsConsts.favColor,
                //       onTap: () {
                //         favsProvider.addAndRemoveFromFav(productId,
                //             prodAttr.price, prodAttr.title, prodAttr.imageUrl);
                //       },
                //       child: Center(
                //         child: Icon(
                //           favsProvider.getFavsItems.containsKey(productId)
                //               ? Icons.favorite
                //               : MyAppIcons.wishlist,
                //           color:
                //               favsProvider.getFavsItems.containsKey(productId)
                //                   ? Colors.red
                //                   : ColorsConsts.white,
                //         ),
                //       ),
                //     ),
                //   ),
                // ),
              ]))
        ],
      ),
    );
  }

  Widget _details(bool themeState, String title, String info) {
    return Padding(
      padding: const EdgeInsets.only(top: 15, left: 16, right: 16),
      child: Row(
        //  mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
                // color: Theme.of(context).textSelectionColor,
                fontWeight: FontWeight.w600,
                fontSize: 21.0),
          ),
          Text(
            info,
            style: const TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 20.0,
              // color: themeState
              //     ? Theme.of(context).disabledColor
              //     : ColorsConsts.subTitle,
            ),
          ),
        ],
      ),
    );
  }
}
