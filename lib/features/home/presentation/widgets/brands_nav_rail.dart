import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/models & providers/product.dart';
import 'brands_nav_rail_widget.dart';

class BrandsNavRailScreen extends StatefulWidget {
  static const routeName = '/brands-nav-rail';
  const BrandsNavRailScreen({Key? key}) : super(key: key);

  @override
  State<BrandsNavRailScreen> createState() => _BrandsNavRailScreenState();
}

class _BrandsNavRailScreenState extends State<BrandsNavRailScreen> {
  late String routeArgs;
  late String brands;
  int _selectedIndex = 0;

  @override
  void didChangeDependencies() {
    routeArgs = ModalRoute.of(context)!.settings.arguments.toString();

    _selectedIndex = int.parse(routeArgs.substring(0, 1));

    if (_selectedIndex == 0) {
      setState(() {
        brands = 'Addidas';
      });
    }
    if (_selectedIndex == 1) {
      setState(() {
        brands = 'Apple';
      });
    }
    if (_selectedIndex == 2) {
      setState(() {
        brands = 'Dell';
      });
    }
    if (_selectedIndex == 3) {
      setState(() {
        brands = 'H&M';
      });
    }
    if (_selectedIndex == 4) {
      setState(() {
        brands = 'Huawei';
      });
    }
    if (_selectedIndex == 5) {
      setState(() {
        brands = 'Nike';
      });
    }
    if (_selectedIndex == 6) {
      setState(() {
        brands = 'Samsung';
      });
    }
    if (_selectedIndex == 7) {
      setState(() {
        brands = 'All';
      });
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          LayoutBuilder(
            builder: (ctx, cons) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: cons.maxHeight),
                  child: IntrinsicHeight(
                    child: NavigationRail(
                      minWidth: 60,
                      selectedLabelTextStyle: TextStyle(
                          letterSpacing: 2.5,
                          fontSize: 25,
                          decoration: TextDecoration.underline,
                          color: Theme.of(context).colorScheme.onBackground),
                      leading: const Padding(
                        padding: EdgeInsets.only(top: 50.0),
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(
                            'https://cdn1.vectorstock.com/i/thumb-large/62/60/default-avatar-photo-placeholder-profile-image-vector-21666260.jpg',
                          ),
                        ),
                      ),
                      labelType: NavigationRailLabelType.all,
                      selectedIndex: _selectedIndex,
                      onDestinationSelected: (index) {
                        setState(() {
                          _selectedIndex = index;
                          if (_selectedIndex == 0) {
                            setState(() {
                              brands = 'Addidas';
                            });
                          }
                          if (_selectedIndex == 1) {
                            setState(() {
                              brands = 'Apple';
                            });
                          }
                          if (_selectedIndex == 2) {
                            setState(() {
                              brands = 'Dell';
                            });
                          }
                          if (_selectedIndex == 3) {
                            setState(() {
                              brands = 'H&M';
                            });
                          }
                          if (_selectedIndex == 4) {
                            setState(() {
                              brands = 'Huawei';
                            });
                          }
                          if (_selectedIndex == 5) {
                            setState(() {
                              brands = 'Nike';
                            });
                          }
                          if (_selectedIndex == 6) {
                            setState(() {
                              brands = 'Samsung';
                            });
                          }
                          if (_selectedIndex == 7) {
                            setState(() {
                              brands = 'All';
                            });
                          }
                        });
                      },
                      destinations: [
                        _navRailRoatedBox('Addidas'),
                        _navRailRoatedBox('Apple'),
                        _navRailRoatedBox('Dell'),
                        _navRailRoatedBox('H&M'),
                        _navRailRoatedBox('Huawei'),
                        _navRailRoatedBox('Nike'),
                        _navRailRoatedBox('Samsung'),
                        _navRailRoatedBox('All'),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
          ContentSpace(brand: brands),
        ],
      ),
    );
  }

  NavigationRailDestination _navRailRoatedBox(String text) {
    return NavigationRailDestination(
      icon: const Icon(null),
      label: RotatedBox(
        quarterTurns: 3,
        child: Text(
          text,
        ),
      ),
    );
  }
}

class ContentSpace extends StatelessWidget {
  final String brand;

  const ContentSpace({
    required this.brand,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<ProductProvider>(context);
    final productBrand = productData.getByBrandName(brand);

    if (brand == 'All') {
      for (int i = 0; i < productData.products().length; i++) {
        productBrand.add(productData.products()[i]);
      }
    }

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24, 0, 0, 0),
        child: MediaQuery.removePadding(
          context: context,
          removeTop: true,
          child: Container(
            margin: const EdgeInsets.only(top: 50),
            child: ListView.builder(
              itemCount: productBrand.length,
              itemBuilder: (ctx, i) {
                return ChangeNotifierProvider.value(
                  value: productBrand[i],
                  child: const BrandNavRailWidget(),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
