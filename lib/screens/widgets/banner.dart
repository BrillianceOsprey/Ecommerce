import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CarouselSlide extends StatefulWidget {
  const CarouselSlide({Key? key}) : super(key: key);

  @override
  State<CarouselSlide> createState() => _CarouselSlideState();
}

class _CarouselSlideState extends State<CarouselSlide> {
  int currentIndex = 0;
  final List<String> _carouselImages = [
    'assets/images/carousel1.png',
    'assets/images/carousel2.jpeg',
    'assets/images/carousel3.jpeg',
    'assets/images/carousel4.png',
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
            items: _carouselImages
                .map((item) => Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20)),
                        child: Image.asset(
                          item,
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                      ),
                    ))
                .toList(),
            options: CarouselOptions(
              // enlargeCenterPage: true,
              // autoPlayCurve: Curves.fastOutSlowIn,
              viewportFraction: 1,
              // reverse: true,
              autoPlayAnimationDuration: const Duration(seconds: 1),

              autoPlay: true,
              // aspectRatio: 18 / 8,
              onPageChanged: (index, reason) {
                setState(() {
                  currentIndex = index;
                  // print(_currentIndex);
                });
              },
            )),
        AnimatedSmoothIndicator(
          activeIndex: currentIndex,
          count: _carouselImages.length,
          // effect: JumpingDotEffect(
          //     dotHeight: 10, dotWidth: 10, dotColor: Colors.red),
          effect: const WormEffect(
              dotHeight: 10,
              dotWidth: 10,
              type: WormType.thin,
              dotColor: Colors.grey,
              activeDotColor: Colors.black38),
        ),
      ],
    );
  }
}
