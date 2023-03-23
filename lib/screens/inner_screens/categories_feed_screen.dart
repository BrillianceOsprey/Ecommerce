import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models & providers/product.dart';
import '../../widgets/feeds_product.dart';

class CategoriesFeedScreen extends StatelessWidget {
  static const routeName = '/Categories-feeds-screen';

  const CategoriesFeedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final catName = ModalRoute.of(context)!.settings.arguments as String;

    final productProvider = Provider.of<ProductProvider>(context);
    List<Product> productsList = productProvider.getByCatName(catName);

    print("ProductLength ${productsList.length}");

    return Scaffold(
      appBar: AppBar(
        title: Text(catName),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: productsList.isEmpty
            ? SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Center(
                    child: Text(
                  '$catName are empty',
                  style: const TextStyle(color: Colors.white),
                )),
              )
            : GridView.builder(
                itemCount: productsList.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 2 / 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemBuilder: (ctx, i) {
                  return ChangeNotifierProvider.value(
                    value: productsList[i],
                    child: const FeedsProduct(),
                  );
                },
              ),
      ),
    );
  }
}
