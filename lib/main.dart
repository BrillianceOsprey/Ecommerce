import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ms_ecommerce_app/models%20&%20providers/product.dart';
import 'package:ms_ecommerce_app/screens/auth/auth_stream.dart';
import 'package:ms_ecommerce_app/screens/bottom_nav_screen.dart';
import 'package:ms_ecommerce_app/screens/home_screen.dart';

import 'package:provider/provider.dart';
import 'models & providers/cart.dart';
import 'models & providers/my_theme.dart';
import 'models & providers/order.dart';
import 'models & providers/wishlist.dart';
import 'screens/auth/login_screen.dart';
import 'screens/auth/reset_password_screen.dart';
import 'screens/auth/signup_screen.dart';
import 'screens/cart/cart_screen.dart';
import 'screens/feeds_screen.dart';
import 'screens/inner_screens/brands_nav_rail.dart';
import 'screens/inner_screens/categories_feed_screen.dart';
import 'screens/inner_screens/product_details_screen.dart';
import 'screens/inner_screens/upload_product_screen.dart';
import 'screens/landing_screen.dart';
import 'screens/orders/orders_screen.dart';
import 'screens/search_screen.dart';
import 'screens/user_scren.dart';
import 'screens/wishlist/wishlist_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => ThemeNotifier()),
        ChangeNotifierProvider(create: (ctx) => ProductProvider()),
        ChangeNotifierProvider(create: (ctx) => CartProvider()),
        ChangeNotifierProvider(create: (ctx) => WishlistProvider()),
        ChangeNotifierProvider(create: (ctx) => OrderProvider()),
      ],
      child: Consumer<ThemeNotifier>(builder: (context, notifier, _) {
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: MyAppTheme.myThemes(notifier.isDark, context),
            home: const AuthStateScreen(),
            routes: {
              BottomNavScreen.routeName: (ctx) => const BottomNavScreen(),
              HomeScreen.routeName: (ctx) => const HomeScreen(),
              FeedsScreen.routeName: (ctx) => const FeedsScreen(),
              SearchScreen.routeName: (ctx) => const SearchScreen(),
              CartScreen.routeName: (ctx) => const CartScreen(),
              UserScreen.routeName: (ctx) => const UserScreen(),
              BrandsNavRailScreen.routeName: (ctx) =>
                  const BrandsNavRailScreen(),
              WishlistScreen.routeName: (ctx) => const WishlistScreen(),
              ProductDetailsScreen.routeName: (ctx) =>
                  const ProductDetailsScreen(),
              CategoriesFeedScreen.routeName: (ctx) =>
                  const CategoriesFeedScreen(),
              LandingScreen.routeName: (ctx) => const LandingScreen(),
              LoginScreen.routeName: (ctx) => const LoginScreen(),
              SignupScreen.routeName: (ctx) => const SignupScreen(),
              UploadProductScreen.routeName: (ctx) =>
                  const UploadProductScreen(),
              ResetPasswordScreen.routeName: (ctx) =>
                  const ResetPasswordScreen(),
              OrderScreen.routeName: (ctx) => const OrderScreen(),
            });
      }),
    );
  }
}
