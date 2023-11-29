import 'package:flutter/material.dart';
import 'package:ms_ecommerce_app/screens/inner_screens/upload_product_screen.dart';

class BackLayer extends StatelessWidget {
  const BackLayer({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const _roatedBox(
          top: -100,
          left: -28,
        ),
        const _roatedBox(
          top: -100,
          left: 200,
        ),
        SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 40),
                Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Image.network(
                        'https://cdn1.vectorstock.com/i/thumb-large/62/60/default-avatar-photo-placeholder-profile-image-vector-21666260.jpg'),
                  ),
                ),
                const SizedBox(height: 40),
                _backLayerButton(
                  title: 'Upload A Product',
                  icon: Icons.upload,
                  onPressed: () {
                    Navigator.of(context)
                        .pushNamed(UploadProductScreen.routeName);
                  },
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

// ignore: camel_case_types
class _roatedBox extends StatelessWidget {
  final double top;
  final double left;
  const _roatedBox({
    required this.top,
    required this.left,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      left: left,
      child: Transform.rotate(
        angle: -0.5,
        child: Container(
          width: 200,
          height: 300,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.2),
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}

// ignore: camel_case_types
class _backLayerButton extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onPressed;
  const _backLayerButton({
    required this.title,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
        onPressed: onPressed, icon: Icon(icon), label: Text(title));
  }
}
