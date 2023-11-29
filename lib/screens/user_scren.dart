// ignore_for_file: unused_element

import 'dart:io';
import 'package:badges/badges.dart' as badges;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ms_ecommerce_app/models%20&%20providers/cart.dart';
import 'package:ms_ecommerce_app/models%20&%20providers/my_theme.dart';
import 'package:ms_ecommerce_app/models%20&%20providers/wishlist.dart';
import 'package:ms_ecommerce_app/screens/cart/cart_screen.dart';
import 'package:ms_ecommerce_app/screens/orders/orders_screen.dart';
import 'package:ms_ecommerce_app/screens/wishlist/wishlist_screen.dart';
import 'package:provider/provider.dart';

class UserScreen extends StatefulWidget {
  static const routeName = '/User-screen';

  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  double top = 0;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String _uid = '';
  String _name = '';
  String _email = '';
  String _joinedAt = '';
  int _phoneNumber = 0;
  String _userImageUrl = '';

  late ScrollController _scrollController;

  void _getData() async {
    User? user = _auth.currentUser;
    _uid = user!.uid;

    if (user.isAnonymous) {
      return;
    } else {
      final DocumentSnapshot userDocs =
          await FirebaseFirestore.instance.collection('users').doc(_uid).get();
      setState(() {
        _name = user.displayName.toString();
        _email = userDocs.get('email');
        _joinedAt = userDocs.get('joinedDate');
        _phoneNumber = userDocs.get('phoneNumber');
        _userImageUrl = user.photoURL.toString();
      });
    }
  }

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      setState(() {});
    });
    _getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            controller: _scrollController,
            slivers: [
              SliverAppBar(
                pinned: true,
                stretch: true,
                expandedHeight: 250,
                flexibleSpace: LayoutBuilder(builder: (ctx, cons) {
                  top = cons.biggest.height;
                  return FlexibleSpaceBar(
                    centerTitle: true,
                    background:
                        // Image.network(
                        //   _userImageUrl,
                        //   fit: BoxFit.cover,
                        // ),
                        CachedNetworkImage(
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
                    title: AnimatedOpacity(
                      duration: const Duration(milliseconds: 300),
                      opacity: top <= 200 ? 1.0 : 0.0,
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 12,
                          ),
                          CircleAvatar(
                            backgroundImage: NetworkImage(_userImageUrl),
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          Text(_name.toString())
                        ],
                      ),
                    ),
                  );
                }),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: ListView(
                    primary: false,
                    shrinkWrap: true,
                    children: [
                      // User Bag
                      const _userTileText(text: 'User Bag'),
                      const _userTileHeightSpace(height: 10),

                      Consumer<WishlistProvider>(builder: (context, wp, _) {
                        return Card(
                          child: ListTile(
                            onTap: () {
                              Navigator.of(context)
                                  .pushNamed(WishlistScreen.routeName);
                            },
                            leading: badges.Badge(
                              // toAnimate: true,
                              // animationType: BadgeAnimationType.slide,
                              // position: BadgePosition.topEnd(top: 0, end: 0),
                              // badgeColor: Colors.indigo,
                              badgeContent: Text(
                                wp.wishlistList.length.toString(),
                                style: const TextStyle(color: Colors.white),
                              ),
                              child: const Icon(
                                Icons.favorite,
                                size: 40,
                                color: Colors.red,
                              ),
                            ),
                            title: const Text('Wishlist'),
                            trailing: const Icon(Icons.arrow_forward_ios),
                          ),
                        );
                      }),

                      Consumer<CartProvider>(builder: (context, cp, _) {
                        return Card(
                          child: ListTile(
                            onTap: () {
                              Navigator.of(context)
                                  .pushNamed(CartScreen.routeName);
                            },
                            leading: badges.Badge(
                              // toAnimate: true,
                              // animationType: BadgeAnimationType.slide,
                              // position: BadgePosition.topEnd(top: 0, end: 0),
                              badgeContent: Text(
                                cp.cartList.length.toString(),
                                style: const TextStyle(color: Colors.white),
                              ),
                              child: const Icon(
                                Icons.shopping_cart,
                                size: 40,
                                color: Colors.deepPurpleAccent,
                              ),
                            ),
                            title: const Text('Wishlist'),
                            trailing: const Icon(Icons.arrow_forward_ios),
                          ),
                        );
                      }),

                      Consumer<WishlistProvider>(builder: (context, wp, _) {
                        return Card(
                          child: ListTile(
                            onTap: () {
                              Navigator.of(context)
                                  .pushNamed(OrderScreen.routeName);
                            },
                            leading: badges.Badge(
                              // toAnimate: true,
                              // animationType: BadgeAnimationType.slide,
                              // position: BadgePosition.topEnd(top: 0, end: 0),
                              // badgeColor: Colors.indigo,
                              badgeContent: Text(
                                wp.wishlistList.length.toString(),
                                style: const TextStyle(color: Colors.white),
                              ),
                              child: const Icon(
                                Icons.shopping_bag,
                                size: 40,
                                color: Colors.greenAccent,
                              ),
                            ),
                            title: const Text('Orders'),
                            trailing: const Icon(Icons.arrow_forward_ios),
                          ),
                        );
                      }),

                      // User Settings
                      const _userTileHeightSpace(height: 15),
                      const _userTileText(text: 'User Settings'),
                      const _userTileHeightSpace(height: 10),
                      Card(
                        child: Consumer<ThemeNotifier>(
                            builder: (context, notifier, _) {
                          return SwitchListTile.adaptive(
                            secondary: notifier.isDark
                                ? Icon(Icons.dark_mode,
                                    color: Colors.amber.shade700)
                                : Icon(Icons.light_mode,
                                    color: Colors.amber.shade700),
                            title: notifier.isDark
                                ? const Text('Dark Mode')
                                : const Text('Light Mode'),
                            value: notifier.isDark,
                            onChanged: (value) {
                              notifier.toggleTheme(value);
                            },
                          );
                        }),
                      ),
                      _userListTile(
                        lIcon: Icons.power_settings_new,
                        color: Colors.red,
                        title: 'Logout',
                        onTap: () async {
                          await _auth.signOut();
                          // Navigator.of(context).canPop()
                          //     ? Navigator.pop(context)
                          //     : null;
                        },
                      ),

                      // User Information
                      const _userTileHeightSpace(height: 15),
                      const _userTileText(text: 'User Informattion'),
                      const _userTileHeightSpace(height: 10),
                      _userListTile(
                        lIcon: Icons.call,
                        color: Colors.green.shade700,
                        title: 'Phone Number',
                        subTitle: _phoneNumber.toString(),
                        onTap: () {},
                      ),
                      _userListTile(
                        lIcon: Icons.email,
                        color: Colors.yellow.shade700,
                        title: 'Email',
                        subTitle: _email,
                        onTap: () {},
                      ),

                      _userListTile(
                        lIcon: Icons.local_shipping,
                        color: Colors.indigo.shade400,
                        title: 'Address',
                        subTitle: 'Address',
                        onTap: () {},
                      ),
                      _userListTile(
                        lIcon: Icons.watch_later,
                        color: Colors.redAccent.shade100,
                        title: 'Join Date',
                        subTitle: _joinedAt,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          _buildFab(),
        ],
      ),
    );
  }

  Widget _buildFab() {
    double defaultMargin = Platform.isIOS ? 270 : 250;
    double scrollStart = 230;
    double scrollEnd = scrollStart / 2;

    double top = defaultMargin;
    double scale = 1.0;

    if (_scrollController.hasClients) {
      double offSet = _scrollController.offset;
      top -= offSet;

      if (offSet < defaultMargin - scrollStart) {
        scale = 1;
      } else if (offSet < defaultMargin - scrollEnd) {
        scale = (defaultMargin - scrollEnd - offSet) / scrollEnd;
      } else {
        scale = 0;
      }
    }

    return Positioned(
      top: top,
      right: 20,
      child: Transform(
        transform: Matrix4.identity()..scale(scale),
        alignment: Alignment.center,
        child: FloatingActionButton(
          child: const Icon(Icons.camera),
          onPressed: () {},
        ),
      ),
    );
  }
}

// ignore: camel_case_types
class _userListTile extends StatelessWidget {
  final IconData lIcon;
  final Color color;
  final String title;
  final String? subTitle;
  final IconData? tIcon;
  final VoidCallback? tIconCallBack;
  final VoidCallback? onTap;
  const _userListTile({
    this.subTitle,
    this.tIcon,
    this.tIconCallBack,
    this.onTap,
    super.key,
    required this.lIcon,
    required this.color,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(
          lIcon,
          color: color,
        ),
        title: Text(title),
        subtitle: subTitle == null ? null : Text(subTitle!),
        onTap: onTap,
        trailing: IconButton(
          icon: Icon(tIcon),
          onPressed: tIconCallBack,
        ),
      ),
    );
  }
}

// ignore: camel_case_types
class _userTileHeightSpace extends StatelessWidget {
  final double height;
  const _userTileHeightSpace({
    super.key,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: height);
  }
}

// ignore: camel_case_types
class _userTileText extends StatelessWidget {
  final String text;
  const _userTileText({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      ' $text',
      style: const TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.w700,
        // decoration: TextDecoration.underline,
      ),
    );
  }
}
