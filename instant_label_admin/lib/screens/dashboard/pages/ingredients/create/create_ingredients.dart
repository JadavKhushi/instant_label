import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:instant_label/config/constants/constant_size.dart';
import 'package:instant_label/config/widget/app_card_widget.dart';
import 'package:instant_label/config/widget/dialog/api_calling_dialog.dart';
import 'package:instant_label/config/widget/form_constraint_widget.dart';
import 'package:instant_label/config/widget/page_body.dart';
import 'package:instant_label/screens/dashboard/pages/ingredients/controller/api/ingredient_controller_api.dart';
import 'package:instant_label/screens/dashboard/pages/ingredients/ingredients_screen.dart';

class CreateIngredients extends StatefulWidget {
  static const String routepath = 'create';
  static const String path = '${IngredientsScreen.path}/$routepath';
  const CreateIngredients({super.key});

  @override
  State<CreateIngredients> createState() => _CreateIngredientsState();
}

class _CreateIngredientsState extends State<CreateIngredients> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _ingreName = TextEditingController();

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      APICallDialog(
        context,
        future: IngredientControllerAPI.createIngredient(_ingreName.text),
        onSuccess: (data) {
          Future.delayed(
            const Duration(milliseconds: 500),
            () {
              context.replace(IngredientsScreen.path);
            },
          );
          return const SizedBox();
        },
      ).create();
    }
  }

  @override
  void dispose() {
    _ingreName.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageBody(
      title: 'Create New Ingredient',
      child: Column(
        children: [
          AppCardWidget(
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: FormConstraintWidget(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      const SizedBox(height: Space_S),
                      TextFormField(
                        controller: _ingreName,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(Space_XS),
                            ),
                          ),
                          label: Text('Ingredient Name'),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please Enter Ingredient!';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: Space_L),
                      ElevatedButton(
                        onPressed: _submitForm,
                        child: const Text('Save'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const Expanded(child: SizedBox()),
        ],
      ),
    );
  }
}
