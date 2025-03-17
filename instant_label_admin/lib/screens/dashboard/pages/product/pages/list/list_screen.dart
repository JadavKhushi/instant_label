import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:instant_label/config/constants/constant_colours.dart';
import 'package:instant_label/config/constants/constant_size.dart';
import 'package:instant_label/config/widget/app_card_widget.dart';
import 'package:instant_label/config/widget/page_body.dart';
import 'package:instant_label/screens/dashboard/pages/product/pages/list/create/create_product.dart';
import 'package:instant_label/screens/dashboard/pages/product/product_screen.dart';

class ListScreen extends StatelessWidget {
  static const String routepath = 'list';
  static const String path = '${ProductScreen.path}/$routepath';

  final int? categoryId;

  const ListScreen({super.key, required this.categoryId});

  @override
  Widget build(BuildContext context) {
    return PageBody(
      title: 'Product List',
      child: AppCardWidget(
        child: Center(
          child: Column(
            children: [
               Container(
              color: PRIMARY_ON_COLOR,
              padding: const EdgeInsets.symmetric(horizontal: Space_S),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Product Item List'),
                  ElevatedButton(
                    onPressed: () {
                      context.go(CreateProduct.path);
                    },
                    child: const Text('Create'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: Space_S),
            const Divider(
              color: PRIMARY_COLOR,
              endIndent: 16,
              height: 1,
              thickness: 2,
            ),
            const Expanded(child: Text('Not yet designed!'),),
             
              // const SizedBox(height: 10),
              // ElevatedButton(
              //   onPressed: () {
              //     context.go(ProductInfo.path);
              //   },
              //   child: const Text('Product-Info'),
              // ),
              // const SizedBox(height: 10),
              // ElevatedButton(
              //   onPressed: () {
              //     context.go(EditProduct.path);
              //   },
              //   child: const Text('Product-Edit'),
              // ),
              // const SizedBox(height: 10),
              // ElevatedButton(
              //   onPressed: () {
              //     context.go(ProductImage.path);
              //   },
              //   child: const Text('Add Image Of Product'),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
