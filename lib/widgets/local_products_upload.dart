import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ms_ecommerce_app/core/helpers/logger.dart';
import 'package:ms_ecommerce_app/models%20&%20providers/product.dart';

class LocalProductUpload extends StatefulWidget {
  const LocalProductUpload({super.key});

  @override
  State<LocalProductUpload> createState() => _LocalProductUploadState();
}

class _LocalProductUploadState extends State<LocalProductUpload> {
  List<Product> prodList = [];
  final FirebaseAuth _auth = FirebaseAuth.instance;
  void uploadAllLocalProduct() async {
    ProductProvider productProvider = ProductProvider();
    List<Product> pList = productProvider.localProducts();
    Logger.clap('LocalProduct List', pList);
    prodList.clear();
    for (var list in pList) {
      for (int i = 0; i < pList.length; i++) {
        prodList = pList.map((e) => e).toList();
      }
    }
    Logger.w('LocalProduct List', prodList[0].brand);

    final User? user = _auth.currentUser;
    for (int i = 0; i < prodList.length; i++) {
      await FirebaseFirestore.instance
          .collection('products')
          .doc(prodList[i].productId)
          .set({
        'createdAt': Timestamp.now(),
        'userId': user?.uid ?? '',
        'productId': prodList[i].productId,
        'productTitle': prodList[i].productTitle,
        'productPrice': prodList[i].productPrice.toString(),
        'productDescription': prodList[i].productDescription,
        'productCategory': 'Test',
        'productImage': prodList[i].productImage,
        'productBrand': prodList[i].brand,
        'productQuantity': prodList[i].quantity.toString(),
      });
    }
    // await FirebaseFirestore.instance
    //         .collection('products')
    //         .doc(productId)
    //         .set({
    //       'createdAt': Timestamp.now(),
    //       'userId': uid,
    //       'productId': productId,
    //       'productTitle': _productTitle,
    //       'productPrice': _productPrice,
    //       'productDescription': _productDescription,
    //       'productCategory': _productCategory,
    //       'productImage': _url,
    //       'productBrand': _productBrand,
    //       'productQuantity': _productQuantity,
    //     });
  }

  @override
  void initState() {
    super.initState();
    uploadAllLocalProduct();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: const Text('Local Products upload'),
        centerTitle: true,
      ),
      body: ElevatedButton(
        onPressed: uploadAllLocalProduct,
        child:
            // ? const Center(
            //     child: CircularProgressIndicator(),
            //   )
            // :
            const Text(
          'S U B M i T',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
