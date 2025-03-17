import 'package:flutter/material.dart';
import 'package:instant_label/screens/dashboard/pages/product/pages/list/list_screen.dart';

class EditProduct extends StatelessWidget {
  static const String routepath = 'edit';
  static const String path = '${ListScreen.path}/$routepath';
  final String data;
  const EditProduct({super.key,required this.data});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color.fromARGB(255, 122, 169, 205),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Text('Edit Product Screen'),
            ],
          ),
        ),
      ),
    );
  }
}
