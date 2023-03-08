import 'package:flutter/material.dart';
import 'package:ms_ecommerce_app/constant/colors.dart';

class CartFull extends StatefulWidget {
  const CartFull({Key? key}) : super(key: key);

  @override
  CartFullState createState() => CartFullState();
}

class CartFullState extends State<CartFull> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      margin: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(16.0),
            topRight: Radius.circular(16.0)),
        color: Colors.grey,
      ),
      child: Row(
        children: [
          Container(
            width: 130,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                    // 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS4PdHtXka2-bDDww6Nuect3Mt9IwpE4v4HNw&usqp=CAU'
                    'https://cdn.shopify.com/static/sample-images/garnished.jpeg?v=1609991286',
                  ),
                  fit: BoxFit.fill),
            ),
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Flexible(
                        child: Text(
                          'Moa Cia',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 15),
                        ),
                      ),
                      Material(
                        color: Colors.transparent,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(32.0),
                          onTap: () {},
                          child: const Icon(
                            Icons.delete,
                            color: Colors.red,
                            size: 22,
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: const [
                      Text('Price:'),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        '450\$',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      const Text('Sub Total:'),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        '450\$',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color:
                                // themeChange.darkTheme
                                //     ? Colors.brown.shade900
                                // :
                                Theme.of(context).accentColor),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        'Ships Free',
                        style: TextStyle(
                            color:
                                // themeChange.darkTheme
                                // ? Colors.brown.shade900
                                // :
                                Theme.of(context).accentColor),
                      ),
                      const Spacer(),
                      Material(
                        color: Colors.transparent,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(4.0),
                          // splashColor: ,
                          onTap: () {},
                          child: const Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Icon(
                              Icons.remove,
                              color: Colors.red,
                              size: 22,
                            ),
                          ),
                        ),
                      ),
                      Card(
                        elevation: 12,
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.12,
                          // height: 30,
                          padding: const EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(colors: [
                              PrimaryColors.gradiendLStart,
                              PrimaryColors.gradiendLEnd,
                            ], stops: const [
                              0.1,
                              0.7
                            ]),
                          ),
                          child: const Text(
                            '154',
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      Material(
                        color: Colors.transparent,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(4.0),
                          // splashColor: ,
                          onTap: () {},
                          child: const Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Icon(
                              Icons.add,
                              color: Colors.green,
                              size: 22,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
