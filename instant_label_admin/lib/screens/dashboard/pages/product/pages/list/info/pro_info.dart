import 'package:flutter/material.dart';
import 'package:instant_label/screens/dashboard/pages/product/pages/list/list_screen.dart';

class ProductInfo extends StatelessWidget {
  static const String routepath = 'info';
  static const String path = '${ListScreen.path}/$routepath';
  const ProductInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor:  Color.fromARGB(255, 191, 246, 170),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Text('Info Screen'),
            ],
          ),
        ),
      ),
    );
  }
}