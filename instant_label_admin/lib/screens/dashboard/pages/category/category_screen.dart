import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:instant_label/config/constants/constant_colours.dart';
import 'package:instant_label/config/constants/constant_fonts.dart';
import 'package:instant_label/config/constants/constant_size.dart';
import 'package:instant_label/config/widget/apicall_widget.dart';
import 'package:instant_label/config/widget/app_card_widget.dart';
import 'package:instant_label/config/widget/page_body.dart';
import 'package:instant_label/screens/dashboard/pages/category/controller/api/category_controller_api.dart';
import 'package:instant_label/screens/dashboard/pages/category/controller/model/category_api.dart';
import 'package:instant_label/screens/dashboard/pages/category/pages/create/create_category.dart';
import 'package:instant_label/screens/dashboard/pages/category/pages/edit/edit_category_screen.dart';

class CategoryScreen extends StatelessWidget {
  static const String routepath = '/category';
  static const String path = routepath;
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PageBody(
      title: 'Category',
      child: AppCardWidget(
        child: Column(
          children: [
            Container(
              color: PRIMARY_ON_COLOR,
              padding: const EdgeInsets.symmetric(horizontal: Space_S),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'data',
                    style: TextStyle(fontFamily: FONTS_REGULAR),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      context.replace(CreateCategory.path);
                    },
                    style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(PRIMARY_COLOR),
                    ),
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
            ///////////////////////
            InkWell(
              splashColor: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(16),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  gradient: const LinearGradient(
                    colors: [
                      //category.color.withOpacity(0.55),
                      // category.color.withOpacity(0.9),
                      Colors.deepPurple,
                      Colors.black,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: const Text(
                  'Category 1',
                  style: TextStyle(
                    color: SECONDARY_COLOR,
                    fontFamily: Fonts_Bold,
                    fontSize: FontSize_L,
                  ),
                ),
              ),
            ),
            ////////
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                list[index].name ?? '',
                                style: const TextStyle(fontSize: FontSize_R),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  context.go(EditCategoryScreen.path);
                                },
                                child: const Text('Edit'),
                              ),
                            ],
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
