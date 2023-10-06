import 'package:flutter/material.dart';
import 'package:ms_ecommerce_app/features/cart/presentation/cart_screen.dart';
import 'package:ms_ecommerce_app/features/feeds/presentation/feeds_screen.dart';
import 'package:ms_ecommerce_app/features/home/presentation/home_screen.dart';
import 'package:ms_ecommerce_app/features/search_screen.dart';
import 'package:ms_ecommerce_app/features/user/presentation/user_scren.dart';

class BottomNavScreen extends StatefulWidget {
  static const routeName = '/Bottom-nav-screen';
  const BottomNavScreen({Key? key}) : super(key: key);

  @override
  BottomNavScreenState createState() => BottomNavScreenState();
}

class BottomNavScreenState extends State<BottomNavScreen> {
  final List _pages = [
    const HomeScreen(),
    const FeedsScreen(),
    const SearchScreen(),
    const CartScreen(),
    const UserScreen(),
  ];

  int _currentIndex = 0;

  _onTap(int i) {
    setState(() {
      _currentIndex = i;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.deepPurpleAccent,
        unselectedItemColor: Colors.grey,
        currentIndex: _currentIndex,
        onTap: _onTap,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home), label: 'Home', tooltip: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.rss_feed), label: 'Feeds', tooltip: 'Feeds'),
          BottomNavigationBarItem(icon: Icon(null), label: '', tooltip: ''),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag), label: 'Cart', tooltip: 'Cart'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person), label: 'User', tooltip: 'User'),
        ],
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: FloatingActionButton(
        tooltip: 'Search',
        onPressed: () {
          _onTap(2);
        },
        child: const Icon(Icons.search),
      ),
    );
  }
}
