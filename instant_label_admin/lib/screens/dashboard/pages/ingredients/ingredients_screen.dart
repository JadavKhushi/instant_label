import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:instant_label/config/constants/constant_colours.dart';
import 'package:instant_label/config/constants/constant_size.dart';
import 'package:instant_label/config/widget/apicall_widget.dart';
import 'package:instant_label/config/widget/app_card_widget.dart';
import 'package:instant_label/config/widget/page_body.dart';
import 'package:instant_label/screens/dashboard/pages/ingredients/controller/api/ingredient_controller_api.dart';
import 'package:instant_label/screens/dashboard/pages/ingredients/controller/model/ingredient_api.dart';
import 'package:instant_label/screens/dashboard/pages/ingredients/create/create_ingredients.dart';
import 'package:instant_label/screens/dashboard/pages/ingredients/edit/edit_ingredients.dart';

class IngredientsScreen extends StatelessWidget {
  static const String routepath = '/ingredients';
  static const String path = routepath;
  const IngredientsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PageBody(
      title: 'Ingredients',
      child: AppCardWidget(
        child: Column(
          children: [
            Container(
              color: PRIMARY_ON_COLOR,
              padding: const EdgeInsets.symmetric(horizontal: Space_S),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('data'),
                  ElevatedButton(
                    onPressed: () {
                      context.go(CreateIngredients.path);
                    },
                    child: const Text('Create'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: Space_S),
            const Divider(
              color: PRIMARY_COLOR,
              height: 1,
              thickness: 2,
            ),
            const SizedBox(height: Space_S),
            Expanded(
              child: APICallWidget(
                future: IngredientControllerAPI.getIngredient(),
                onSuccess: (data) {
                  IngredientAPI api = data;
                  if (api.status ?? false) {
                    List<IngredientAPIData> list = api.data ?? [];
                    return ListView.builder(
                      padding: const EdgeInsets.all(50),
                      itemCount: list.length,
                      itemBuilder: (context, index) => Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                list[index].ingredients ?? '',
                                style: const TextStyle(fontSize: FontSize_R),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  context.go(EditIngredientsScreen.path);
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
