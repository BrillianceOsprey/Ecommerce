import 'package:flutter/material.dart';
import 'package:ms_ecommerce_app/constant/colors.dart';
import 'package:ms_ecommerce_app/widgets/cartempty.dart';
import 'package:ms_ecommerce_app/widgets/fullcart.dart';

class Cart extends StatelessWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List products = [];
    return products.isNotEmpty
        ? const Scaffold(
            body: CartEmpty(),
          )
        : Scaffold(
            bottomSheet: checkoutScetion(context),
            appBar: AppBar(
              title: const Text('Cart Items Count'),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.brush),
                )
              ],
            ),
            body: Container(
              margin: const EdgeInsets.only(bottom: 60),
              child: ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return const CartFull();
                },
                itemCount: 5,
              ),
            ),
          );
  }

  Widget checkoutScetion(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(color: Colors.grey, width: 0.5),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  gradient: LinearGradient(colors: [
                    PrimaryColors.gradiendLStart,
                    PrimaryColors.gradiendLEnd,
                  ], stops: const [
                    0.1,
                    0.7
                  ]),
                ),
                child: Material(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(30),
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Checkout',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Theme.of(context)
                                .textSelectionTheme
                                .selectionColor,
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const Spacer(),
            Text(
              'Total',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Theme.of(context).textSelectionTheme.selectionColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              width: 5,
            ),
            const Text(
              '(US \$555.0)',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.blue),
            ),
          ],
        ),
      ),
    );
  }
}
