import 'package:flutter/material.dart';
import 'package:ms_ecommerce_app/core/models%20&%20providers/wishlist.dart';
import 'package:ms_ecommerce_app/features/home/presentation/widgets/product_details_screen.dart';
import 'package:provider/provider.dart';

class FullWishlist extends StatefulWidget {
  final String pId;
  const FullWishlist({
    Key? key,
    required this.pId,
  }) : super(key: key);

  @override
  State<FullWishlist> createState() => _FullWishlistState();
}

class _FullWishlistState extends State<FullWishlist> {
  @override
  Widget build(BuildContext context) {
    final wishlistAttribute = Provider.of<Wishlist>(context);

    final wishlistProvider = Provider.of<WishlistProvider>(context);

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
                      wishlistAttribute.imageUrl,
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text(
                            wishlistAttribute.title,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(fontSize: 18),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: InkWell(
                            onTap: () {
                              wishlistProvider.removeItem(widget.pId);
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
                            '\$${(wishlistAttribute.price).toStringAsFixed(2)}',
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(fontSize: 16),
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
