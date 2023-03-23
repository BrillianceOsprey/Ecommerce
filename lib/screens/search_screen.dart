import 'package:flutter/material.dart';
import 'package:ms_ecommerce_app/models%20&%20providers/product.dart';
import 'package:ms_ecommerce_app/widgets/feeds_product.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  static const routeName = '/Search-screen';

  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late TextEditingController _controller;
  final FocusNode _node = FocusNode();

  @override
  void initState() {
    _controller = TextEditingController();
    _controller.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    _node.dispose();
    super.dispose();
  }

  late List<Product> _searchList;

  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<ProductProvider>(context);
    final productList = productData.products();
    return Scaffold(
      bottomSheet: TextField(
        controller: _controller,
        focusNode: _node,
        onChanged: (val) {
          setState(() {
            _searchList = productData.getBySearch(val);
          });
        },
        minLines: 1,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(width: 0, style: BorderStyle.none),
          ),
          prefixIcon: const Icon(Icons.search),
          suffixIcon: IconButton(
            onPressed: _controller.text.isEmpty
                ? () {}
                : () {
                    _controller.clear();
                    _node.unfocus();
                  },
            icon: Icon(
              Icons.close,
              color: _controller.text.isNotEmpty ? Colors.red : Colors.grey,
            ),
          ),
        ),
      ),
      body: _controller.text.isNotEmpty && _searchList.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  SizedBox(height: 50),
                  Icon(Icons.search, size: 60),
                  SizedBox(height: 50),
                  Text('No results found',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                ],
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                itemCount: _controller.text.isNotEmpty
                    ? _searchList.length
                    : productList.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 2 / 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemBuilder: (ctx, i) {
                  return ChangeNotifierProvider.value(
                    value: _controller.text.isNotEmpty
                        ? _searchList[i]
                        : productList[i],
                    child: const FeedsProduct(),
                  );
                },
              ),
            ),
    );
  }
}
