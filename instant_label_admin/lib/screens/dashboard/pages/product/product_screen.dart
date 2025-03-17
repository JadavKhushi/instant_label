import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:instant_label/config/constants/constant_colours.dart';
import 'package:instant_label/config/constants/constant_size.dart';
import 'package:instant_label/config/widget/apicall_widget.dart';
import 'package:instant_label/config/widget/app_card_widget.dart';
import 'package:instant_label/config/widget/page_body.dart';
import 'package:instant_label/screens/dashboard/pages/category/controller/api/category_controller_api.dart';
import 'package:instant_label/screens/dashboard/pages/category/controller/model/category_api.dart';
import 'package:instant_label/screens/dashboard/pages/product/pages/list/create/create_product.dart';
import 'package:instant_label/screens/dashboard/pages/product/pages/list/list_screen.dart';

class ProductScreen extends StatelessWidget {
  static const String routepath = '/product';
  static const String path = routepath;
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PageBody(
      title: 'Product',
      child: AppCardWidget(
        child: Column(
          children: [
            Container(
              color: PRIMARY_ON_COLOR,
              padding: const EdgeInsets.symmetric(horizontal: Space_S),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Products category'),
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

            //list of category
            //select categorey of product to see that type of product list
            Expanded(
              child: APICallWidget<CategoryAPI>(
                future: CategoryControllerAPI.getCategory(),
                onSuccess: (data) {
                  CategoryAPI api = data;
                  if (api.status ?? false) {
                    List<CategoryAPIData> list = api.data ?? [];
                    return ListView.builder(
                      padding: const EdgeInsets.all(50),
                      itemCount: list.length,
                      itemBuilder: (context, index) => Column(
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              context.go(ListScreen.path,
                                  extra: list[index].categoryId);
                            },
                            style: const ButtonStyle(
                              backgroundColor:
                                  MaterialStatePropertyAll(PRIMARY_COLOR),
                            ),
                            child: Text(
                              list[index].name ?? '',
                              style: const TextStyle(
                                  fontSize: FontSize_R,
                                  color: PRIMARY_ON_COLOR),
                            ),
                          ),
                          const SizedBox(height: Space_S),
                          const Divider(
                            color: PRIMARY_COLOR,
                            height: 1,
                            thickness: 2,
                          ),
                          const SizedBox(height: Space_S),
                        ],
                      ),
                    );
                  } else {
                    return const Text('Something is wrong');
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
