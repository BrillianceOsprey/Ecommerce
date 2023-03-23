import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ms_ecommerce_app/models%20&%20providers/order.dart' as order;
import 'package:ms_ecommerce_app/screens/inner_screens/product_details_screen.dart';
import 'package:provider/provider.dart';

class FullOrder extends StatefulWidget {
  const FullOrder({
    Key? key,
  }) : super(key: key);

  @override
  State<FullOrder> createState() => _FullOrderState();
}

class _FullOrderState extends State<FullOrder> {
  @override
  Widget build(BuildContext context) {
    final orders = Provider.of<order.Order>(context);
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(
          ProductDetailsScreen.routeName,
          arguments: orders.productId,
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
                      orders.imageUrl,
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
                            orders.title,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(fontSize: 18),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: InkWell(
                            onTap: () {
                              FirebaseFirestore.instance
                                  .collection('orders')
                                  .doc(orders.orderId)
                                  .delete();
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
                            '\$ ${orders.price}',
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Text(
                          'Quantity : ',
                          style: TextStyle(fontSize: 16),
                        ),
                        Flexible(
                          child: Text(
                            'X ${orders.quantity}',
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                    // Row(
                    //   children: [
                    //     const Text(
                    //       'SubTotal : ',
                    //       style: TextStyle(fontSize: 16),
                    //     ),
                    //     Flexible(
                    //       child: Text(
                    //         '\$',
                    //         overflow: TextOverflow.ellipsis,
                    //         style: TextStyle(fontSize: 16),
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    // Row(
                    //   children: [
                    //     const Text(
                    //       'Shipping : ',
                    //       style: TextStyle(fontSize: 16),
                    //     ),
                    //     Flexible(
                    //       child: Text(
                    //         '\$450.00',
                    //         overflow: TextOverflow.ellipsis,
                    //         style: TextStyle(fontSize: 16),
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.end,
                    //   children: [
                    //     TextButton(
                    //       onPressed: OrderAttribute.quantity < 2
                    //           ? () {}
                    //           : () {
                    //               OrderProvider.decrementOrderProductQuantity(
                    //                 widget.pId,
                    //                 OrderAttribute.title,
                    //                 OrderAttribute.imageUrl,
                    //                 OrderAttribute.price,
                    //               );
                    //             },
                    //       child: const Text(
                    //         '-',
                    //         style: TextStyle(fontSize: 25),
                    //       ),
                    //     ),
                    //     Text(
                    //       OrderAttribute.quantity.toString(),
                    //       style: TextStyle(fontSize: 20),
                    //     ),
                    //     TextButton(
                    //       onPressed: () {
                    //         OrderProvider.addToOrder(
                    //           widget.pId,
                    //           OrderAttribute.title,
                    //           OrderAttribute.imageUrl,
                    //           OrderAttribute.price,
                    //         );
                    //       },
                    //       child: const Text(
                    //         '+',
                    //         style: TextStyle(fontSize: 20),
                    //       ),
                    //     ),
                    //   ],
                    // ),
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
