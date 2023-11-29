import 'package:flutter/material.dart';
import 'package:ms_ecommerce_app/screens/bottom_nav_screen.dart';
import 'package:ms_ecommerce_app/screens/inner_screens/upload_product_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView(
      children: const [
        BottomNavScreen(),
        UploadProductScreen(),
      ],
    );
  }
}
