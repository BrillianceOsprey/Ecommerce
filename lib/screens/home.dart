import 'package:backdrop/backdrop.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:ms_ecommerce_app/widgets/backlayer.dart';
import 'package:ms_ecommerce_app/widgets/category.dart';
import 'package:ms_ecommerce_app/widgets/popular_products.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  final List _carouselImages = [
    'assets/images/carousel1.png',
    'assets/images/carousel2.jpeg',
    'assets/images/carousel3.jpg',
    'assets/images/carousel4.png',
  ];
  final List _brandImages = [
    'assets/images/addidas.jpg',
    'assets/images/apple.jpg',
    'assets/images/dell.jpg',
    'assets/images/h&m.jpg',
    'assets/images/nike.jpg',
    'assets/images/samsung.jpg',
    'assets/images/huawei.jpg',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackdropScaffold(
        appBar: BackdropAppBar(
          title: const Text('HOme'),
          leading: const BackdropToggleButton(
            icon: AnimatedIcons.home_menu,
          ),
          flexibleSpace: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [
              Colors.pink,
              Colors.purple,
            ])),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              iconSize: 15,
              padding: const EdgeInsets.all(10),
              icon: const CircleAvatar(
                radius: 15,
                backgroundColor: Colors.white,
                child: CircleAvatar(
                  radius: 13,
                  backgroundImage: NetworkImage(
                      'https://cdn1.vectorstock.com/i/thumb-large/62/60/default-avatar-photo-placeholder-profile-image-vector-21666260.jpg'),
                ),
              ),
            )
          ],
        ),
        // backLayer: Center(child: Text("Back Layer")),
        backLayer: BackLayerMenu(),
        frontLayer: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 190.0,
                width: double.infinity,
                child: Carousel(
                  boxFit: BoxFit.fill,
                  autoplay: true,
                  animationCurve: Curves.fastOutSlowIn,
                  animationDuration: const Duration(milliseconds: 1000),
                  dotSize: 5.0,
                  dotIncreasedColor: Colors.purple,
                  dotBgColor: Colors.black.withOpacity(0.2),
                  dotPosition: DotPosition.bottomCenter,
                  showIndicator: true,
                  indicatorBgPadding: 5.0,
                  images: [
                    ExactAssetImage(_carouselImages[0]),
                    ExactAssetImage(_carouselImages[1]),
                    ExactAssetImage(_carouselImages[2]),
                    ExactAssetImage(_carouselImages[3]),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Categories',
                  style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20),
                ),
              ),
              SizedBox(
                width: double.infinity,
                height: 180,
                child: ListView.builder(
                  itemCount: 7,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext ctx, int index) {
                    return CategoryWidget(
                      index: index,
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    const Text(
                      'Popular Brands',
                      style:
                          TextStyle(fontWeight: FontWeight.w800, fontSize: 20),
                    ),
                    const Spacer(),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'View all...',
                        style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 15,
                            color: Colors.red),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 210,
                width: MediaQuery.of(context).size.width * 0.95,
                child: Swiper(
                  itemCount: _brandImages.length,
                  autoplay: true,
                  viewportFraction: 0.8,
                  scale: 0.9,
                  onTap: (index) {},
                  itemBuilder: (BuildContext ctx, int index) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        color: Colors.blueGrey,
                        child: Image.asset(
                          _brandImages[index],
                          fit: BoxFit.fill,
                        ),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    const Text(
                      'Popular Products',
                      style:
                          TextStyle(fontWeight: FontWeight.w800, fontSize: 20),
                    ),
                    const Spacer(),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'View all...',
                        style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 15,
                            color: Colors.red),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: 285,
                margin: const EdgeInsets.symmetric(horizontal: 3),
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 8,
                    itemBuilder: (BuildContext ctx, int index) {
                      return PopularProducts();
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
