import 'package:flutter/material.dart';
import 'package:ms_ecommerce_app/screens/cart.dart';
import 'package:ms_ecommerce_app/screens/feeds.dart';
import 'package:ms_ecommerce_app/screens/home.dart';
import 'package:ms_ecommerce_app/screens/search.dart';
import 'package:ms_ecommerce_app/screens/user_info.dart';

class BottomBarScreen extends StatefulWidget {
  const BottomBarScreen({Key? key}) : super(key: key);

  @override
  BottomBarScreenState createState() => BottomBarScreenState();
}

class BottomBarScreenState extends State<BottomBarScreen> {
  late List<Map<String, Widget>> _pages;
  int _selectedPageIndex = 0;

  @override
  void initState() {
    _pages = [
      {
        'page': const Home(),
      },
      {
        'page': const Feeds(),
      },
      {
        'page': const Search(),
      },
      {
        'page': const Cart(),
      },
      {
        'page': const UserInfo(),
      },
    ];
    super.initState();
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomAppBar(
        // color: Colors.white,
        shape: const CircularNotchedRectangle(),
        notchMargin: 0.01,
        clipBehavior: Clip.antiAlias,
        child: SizedBox(
          height: kBottomNavigationBarHeight * 0.98,
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              border: Border(
                top: BorderSide(
                  color: Colors.red,
                  width: 0.5,
                ),
              ),
            ),
            child: BottomNavigationBar(
              onTap: _selectPage,
              backgroundColor: Theme.of(context).primaryColor,
              // unselectedItemColor: Theme.of(context).textSelectionColor,
              unselectedItemColor: Colors.black,
              selectedItemColor: Colors.purple,
              currentIndex: _selectedPageIndex,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.rss_feed),
                  label: 'Feeds',
                  // backgroundColor: Colors.red,
                ),
                BottomNavigationBarItem(
                  activeIcon: null,
                  icon: Icon(null),
                  label: 'Search',
                  // backgroundColor: Colors.green,
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.card_giftcard,
                  ),
                  label: 'Cart',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: 'User',
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FloatingActionButton(
          hoverElevation: 10,
          splashColor: Colors.grey,
          tooltip: 'Search',
          elevation: 4,
          child: const Icon(Icons.search),
          onPressed: () => setState(() {
            _selectedPageIndex = 2;
          }),
        ),
      ),
    );
  }
}
