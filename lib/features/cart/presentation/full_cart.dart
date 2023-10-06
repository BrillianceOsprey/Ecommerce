import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/models & providers/cart.dart';
import '../../home/presentation/widgets/product_details_screen.dart';

class FullCart extends StatefulWidget {
  final String pId;
  // final String id;
  // final String title;
  // final String imageUrl;
  // final int quantity;
  // final double price;
  const FullCart({
    Key? key,
    required this.pId,
    // required this.id,
    // required this.imageUrl,
    // required this.price,
    // required this.quantity,
    // required this.title,
  }) : super(key: key);

  @override
  FullCartState createState() => FullCartState();
}

class FullCartState extends State<FullCart> {
  @override
  // double subTotaal = widget.quantity * widget.price;
  Widget build(BuildContext context) {
    final cartAttribute = Provider.of<Cart>(context);

    final cartProvider = Provider.of<CartProvider>(context);

    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(
          ProductDetailsScreen.routeName,
          arguments: widget.pId,
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Container(
          width: double.infinity,
          height: 150,
          decoration: BoxDecoration(
            border: Border.all(width: 2, color: Colors.grey),
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(16),
              bottomRight: Radius.circular(16),
            ),
          ),
          child: Row(
            children: [
              Container(
                width: 130,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  image: DecorationImage(
                    image: NetworkImage(
                      cartAttribute.imageUrl,
                    ),
                    // fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Flexible(
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text(
                            cartAttribute.title,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(fontSize: 18),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: InkWell(
                            onTap: () {
                              cartProvider.removeItem(widget.pId);
                            },
                            child: const Icon(
                              Icons.close,
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 7),
                    Row(
                      children: [
                        const Text(
                          'Price : ',
                          style: TextStyle(fontSize: 16),
                        ),
                        Flexible(
                          child: Text(
                            '\$${cartAttribute.price}',
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Text(
                          'SubTotal : ',
                          style: TextStyle(fontSize: 16),
                        ),
                        Flexible(
                          child: Text(
                            '\$${(cartAttribute.price * cartAttribute.quantity).toStringAsFixed(2)}',
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                    const Row(
                      children: [
                        Text(
                          'Shipping : ',
                          style: TextStyle(fontSize: 16),
                        ),
                        Flexible(
                          child: Text(
                            '\$450.00',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: cartAttribute.quantity < 2
                              ? () {}
                              : () {
                                  cartProvider.decrementCartProductQuantity(
                                    widget.pId,
                                    cartAttribute.title,
                                    cartAttribute.imageUrl,
                                    cartAttribute.price,
                                  );
                                },
                          child: const Text(
                            '-',
                            style: TextStyle(fontSize: 25),
                          ),
                        ),
                        Text(
                          cartAttribute.quantity.toString(),
                          style: const TextStyle(fontSize: 20),
                        ),
                        TextButton(
                          onPressed: () {
                            cartProvider.addToCart(
                              widget.pId,
                              cartAttribute.title,
                              cartAttribute.imageUrl,
                              cartAttribute.price,
                            );
                          },
                          child: const Text(
                            '+',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
