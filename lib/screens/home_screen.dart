// ignore_for_file: avoid_print

import 'package:backdrop/backdrop.dart';
import 'package:badges/badges.dart' as badges;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:ms_ecommerce_app/core/helpers/logger.dart';
import 'package:ms_ecommerce_app/models%20&%20providers/product.dart';
import 'package:ms_ecommerce_app/models%20&%20providers/wishlist.dart';
import 'package:ms_ecommerce_app/screens/feeds_screen.dart';
import 'package:ms_ecommerce_app/screens/inner_screens/brands_nav_rail.dart';
import 'package:ms_ecommerce_app/screens/widgets/banner.dart';
import 'package:ms_ecommerce_app/screens/wishlist/wishlist_screen.dart';
import 'package:ms_ecommerce_app/widgets/back_layer.dart';
import 'package:ms_ecommerce_app/widgets/category.dart';
import 'package:ms_ecommerce_app/widgets/popular_propducts.dart';
import 'package:provider/provider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/Home-screen';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // final List<Widget> _carouselImages = [
  //   Image.asset('assets/images/carousel1.png'),
  //   Image.asset('assets/images/carousel2.jpeg'),
  //   Image.asset('assets/images/carousel3.jpeg'),
  //   Image.asset('assets/images/carousel4.png'),
  // ];

  final List _swiperImages = [
    'assets/images/addidas.jpeg',
    'assets/images/apple.jpeg',
    'assets/images/Dell.jpeg',
    'assets/images/h&m.jpeg',
    'assets/images/Huawei.jpeg',
    'assets/images/nike.jpeg',
    'assets/images/samsung.jpeg',
  ];
  ProductProvider productProvider = ProductProvider();
  Future<void> getData() async {
    Future.microtask(() {
      productProvider.fetchProducts();
      productProvider.popularProducts;
      _getUserData();
    });
  }

  String _userImageUrl = "";
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void _getUserData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var data = preferences.getString("image_url") ?? '';
    User? user = _auth.currentUser;
    Logger.clap(';asldjf;lksdfj', preferences.getString("image_url"));
    // String uid = "";
    if (user!.isAnonymous) {
      return;
    } else {
      // final DocumentSnapshot userDocs =
      //     await FirebaseFirestore.instance.collection('users').doc(uid).get();
      setState(() {
        // _userImageUrl = user.photoURL!.isEmpty
        //     ? "https://cdn1.vectorstock.com/i/thumb-large/62/60/default-avatar-photo-placeholder-profile-image-vector-21666260.jpg"
        //     : user.photoURL ?? '';
        if (data.isNotEmpty) {
          preferences.setString('image_url', user.photoURL ?? '');
          _userImageUrl = preferences.getString('image_url') ?? '';
        }
      });
    }
  }

  @override
  void didUpdateWidget(covariant HomeScreen oldWidget) {
    _getUserData();
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    // final productData = Provider.of<ProductProvider>(context);

    final popularProduct = productProvider.popularProducts;
    print('Product list ${popularProduct.length}');
    productProvider.fetchProducts();

    return Scaffold(
      body: BackdropScaffold(
        headerHeight: MediaQuery.of(context).size.height * 0.4,
        backLayerBackgroundColor: Colors.grey.shade900,
        appBar: BackdropAppBar(
          title: const Text('Flutter Shop'),
          leading: const BackdropToggleButton(
            icon: AnimatedIcons.home_menu,
          ),
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
                position: badges.BadgePosition.topEnd(top: 1, end: 3),
                child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(WishlistScreen.routeName);
                  },
                  icon: const Icon(Icons.favorite),
                ),
              );
            }),
            IconButton(
              onPressed: () {},
              icon: CircleAvatar(
                backgroundColor: Colors.white,
                child:
                    // CircleAvatar(
                    //   radius: 14,
                    //   backgroundImage:
                    //   NetworkImage(
                    //     _userImageUrl,
                    //   ),

                    // ),
                    CircleAvatar(
                  radius: 14,
                  child: CachedNetworkImage(
                    imageUrl: _userImageUrl,
                    imageBuilder: (context, imageProvider) => Container(
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(50),
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.cover,
                          // colorFilter: const ColorFilter.mode(
                          //     Colors.red, BlendMode.colorBurn),
                        ),
                      ),
                    ),
                    placeholder: (context, url) =>
                        const CircularProgressIndicator(),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),
              ),
            ),
          ],
        ),
        backLayer: const BackLayer(),
        frontLayer: RefreshIndicator(
          onRefresh: getData,
          child: ListView(
            children: [
              const SizedBox(width: double.infinity, child: CarouselSlide()
                  // Carousel(
                  //   images: _carouselImages,
                  //   indicatorBgPadding: 7,
                  //   dotSize: 5,
                  //   boxFit: BoxFit.fill,
                  // ),
                  ),
              const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  'Categories',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
              ),
              const SizedBox(height: 8),
              SizedBox(
                height: 200,
                width: double.infinity,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 7,
                  itemBuilder: (ctx, i) {
                    return Row(
                      children: [
                        Category(
                          i: i,
                        ),
                        const SizedBox(width: 10),
                      ],
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Popular Brands',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed(
                            BrandsNavRailScreen.routeName,
                            arguments: 7,
                          );
                        },
                        child: const Text('view all')),
                  ],
                ),
              ),
              SizedBox(
                height: 200,
                width: double.infinity,
                child: Swiper(
                  onTap: (index) {
                    Navigator.of(context).pushNamed(
                      BrandsNavRailScreen.routeName,
                      arguments: index,
                    );
                  },
                  autoplay: true,
                  viewportFraction: 0.8,
                  scale: 0.9,
                  itemCount: _swiperImages.length,
                  itemBuilder: (ctx, i) {
                    return Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                            width: 2,
                            color: Theme.of(context).colorScheme.onBackground),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Image.asset(
                        _swiperImages[i],
                        fit: BoxFit.contain,
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Popular Products',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed(
                          FeedsScreen.routeName,
                          arguments: 'popular',
                        );
                      },
                      child: const Text('view all'),
                    ),
                  ],
                ),
              ),
              SizedBox(
                // color: Colors.amber,
                height: 300,
                width: double.infinity,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: popularProduct.length,
                  itemBuilder: (ctx, i) {
                    return ChangeNotifierProvider.value(
                      value: popularProduct[i],
                      child: const PopularProducts(),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
