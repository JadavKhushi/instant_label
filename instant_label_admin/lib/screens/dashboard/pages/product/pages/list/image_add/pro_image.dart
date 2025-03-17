import 'package:flutter/material.dart';
import 'package:instant_label/screens/dashboard/pages/product/pages/list/list_screen.dart';

class ProductImage extends StatelessWidget {
  static const String routepath = 'list';
  static const String path = '${ListScreen.path}/$routepath';
  const ProductImage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor:  Color.fromARGB(255, 184, 121, 218),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Text('Product Image Screen'),
            ],
          ),
        ),
      ),
    );
  }
}