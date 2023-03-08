import 'package:flutter/material.dart';

class CartEmpty extends StatelessWidget {
  const CartEmpty({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 80),
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.4,
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage('assets/images/emptycart.png'),
              ),
            ),
          ),
          Text(
            'Your Cart is Empty',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Theme.of(context).textSelectionTheme.selectionColor,
                fontSize: 36,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            'Looks Like You didn\'t \n add anything to your cart yet',
            textAlign: TextAlign.center,
            style: TextStyle(
                color:
                    // themeChange.darkTheme
                    //?
                    //Theme.of(context).disabledColor
                    //:
                    Colors.grey.shade600,
                fontSize: 26,
                fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 50,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            height: MediaQuery.of(context).size.height * 0.06,

            child: ElevatedButton(
              onPressed: () {},
              child: const Text('SHOP NOW'),
              onLongPress: () {
                print('Shop Now');
              },
            ),
            // child: RaisedButton(
            //   onPressed: () {},
            //   shape: RoundedRectangleBorder(
            //     borderRadius: BorderRadius.circular(16),
            //     side: BorderSide(color: Colors.red),
            //   ),
            //   color: Colors.redAccent,
            //   child: Text(
            //     'shop now'.toUpperCase(),
            //     textAlign: TextAlign.center,
            //     style: TextStyle(
            //         color: Theme.of(context).textSelectionColor,
            //         fontSize: 26,
            //         fontWeight: FontWeight.w600),
            //   ),
            // ),
          ),
        ],
      ),
    );
  }
}
