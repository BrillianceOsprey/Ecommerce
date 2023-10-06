import 'package:flutter/material.dart';
import 'package:ms_ecommerce_app/features/home/presentation/widgets/categories_feed_screen.dart';

class Category extends StatefulWidget {
  final int i;

  const Category({
    required this.i,
    Key? key,
  }) : super(key: key);

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  final List<Map<String, Object>> _categories = [
    {
      'catName': 'Phones',
      'catImage': 'assets/images/CatPhones.png',
    },
    {
      'catName': 'Laptops',
      'catImage': 'assets/images/CatLaptops.png',
    },
    {
      'catName': 'Clothes',
      'catImage': 'assets/images/CatClothes.jpeg',
    },
    {
      'catName': 'Shoes',
      'catImage': 'assets/images/CatShoes.jpeg',
    },
    {
      'catName': 'Watches',
      'catImage': 'assets/images/CatWatches.jpeg',
    },
    {
      'catName': 'Furniture',
      'catImage': 'assets/images/CatFurniture.jpeg',
    },
    {
      'catName': 'Health',
      'catImage': 'assets/images/CatBeauty.jpeg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(
          CategoriesFeedScreen.routeName,
          arguments: _categories[widget.i]['catName'],
        );
        // print('${_categories[widget.i]['catName']}');
      },
      child: Container(
        height: 200,
        width: 150,
        decoration: BoxDecoration(
          border: Border.all(
              width: 2, color: Theme.of(context).colorScheme.onBackground),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 150,
              width: 150,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                child: Image.asset(
                  (_categories[widget.i]['catImage']).toString(),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              ' ${(_categories[widget.i]['catName']).toString()}',
              style: const TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
