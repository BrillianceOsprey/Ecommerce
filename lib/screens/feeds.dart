import 'package:flutter/material.dart';
import 'package:ms_ecommerce_app/widgets/feeds_product.dart';

class Feeds extends StatelessWidget {
  const Feeds({Key? key}) : super(key: key);
  static const routeName = '/Feeds';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Feeds Screens'),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
            Colors.pink,
            Colors.purple,
          ])),
        ),
        centerTitle: true,
      ),
      body:
          //     StaggeredGridView.countBuilder(
          //   crossAxisCount: 6,
          //   itemCount: 8,
          //   itemBuilder: (BuildContext context, int index) => new FeedProducts(),
          //   staggeredTileBuilder: (int index) =>
          //       new StaggeredTile.count(3, index.isEven ? 4 : 5),
          //   mainAxisSpacing: 8.0,
          //   crossAxisSpacing: 6.0,
          // )
          GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 250 / 290,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        children: List.generate(100, (index) => FeedProducts()),
      ),
    );
  }
}
