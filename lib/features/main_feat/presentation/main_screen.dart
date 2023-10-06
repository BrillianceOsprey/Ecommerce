import 'package:flutter/material.dart';
import 'package:ms_ecommerce_app/features/main_feat/presentation/bottom_nav_screen.dart';
import 'package:ms_ecommerce_app/features/home/presentation/widgets/upload_product_screen.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

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
