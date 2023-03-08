import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:ms_ecommerce_app/widgets/product_detail.dart';

class FeedProducts extends StatefulWidget {
  const FeedProducts({Key? key}) : super(key: key);

  @override
  FeedState createState() => FeedState();
}

class FeedState extends State<FeedProducts> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (cxt) {
            return ProductDetails();
          }));
        },
        child: Container(
          height: 290,
          width: 250,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6.0),
            color: Theme.of(context).colorScheme.background,
          ),
          child: Column(
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(2),
                    child: Container(
                      width: double.infinity,
                      constraints: BoxConstraints(
                          minHeight: 100,
                          maxHeight: MediaQuery.of(context).size.height * 0.4),
                      child: Image.network(
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS4PdHtXka2-bDDww6Nuect3Mt9IwpE4v4HNw&usqp=CAU',
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                  // Badge(
                  //   toAnimate: true,
                  //   shape: BadgeShape.square,
                  //   badgeColor: Colors.pink,
                  //   borderRadius:
                  //       BorderRadius.only(bottomRight: Radius.circular(8)),
                  //   badgeContent:
                  //       Text('New', style: TextStyle(color: Colors.white)),
                  // ),
                  SizedBox(
                    height: 30,
                    width: 30,
                    child: badges.Badge(
                      // position: badges.BadgePosition.topEnd(top: -10, end: -12),
                      position:
                          badges.BadgePosition.custom(start: 140, top: 10),
                      showBadge: true,
                      ignorePointer: false,
                      onTap: () {},
                      badgeContent:
                          // Icon(Icons.check, color: Colors.white, size: 10),
                          const Text(
                        'New',
                        style: TextStyle(fontSize: 10),
                      ),
                      // badgeAnimation: badges.BadgeAnimation.rotation(
                      //   animationDuration: Duration(seconds: 1),
                      //   colorChangeAnimationDuration: Duration(seconds: 1),
                      //   loopAnimation: false,
                      //   curve: Curves.fastOutSlowIn,
                      //   colorChangeAnimationCurve: Curves.easeInCubic,
                      // ),
                      badgeStyle: badges.BadgeStyle(
                        shape: badges.BadgeShape.square,
                        badgeColor: Colors.blue,
                        padding: const EdgeInsets.all(5),
                        borderRadius: BorderRadius.circular(4),
                        borderSide:
                            const BorderSide(color: Colors.white, width: 2),
                        borderGradient: const badges.BadgeGradient.linear(
                            colors: [Colors.red, Colors.black]),
                        badgeGradient: const badges.BadgeGradient.linear(
                          colors: [Colors.blue, Colors.yellow],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                        elevation: 0,
                      ),
                      child: const Text('Badge'),
                    ),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.only(left: 5),
                margin: const EdgeInsets.only(left: 5, bottom: 2, right: 3),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 5,
                    ),
                    const Text(
                      'Description',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.w600),
                    ),
                    const Text(
                      '\$ 555.5',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.w900),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Quantity: 12left',
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.grey,
                              fontWeight: FontWeight.w600),
                        ),
                        Material(
                          child: InkWell(
                            child: const Icon(
                              Icons.more_horiz,
                              color: Colors.grey,
                            ),
                            onTap: () {},
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
