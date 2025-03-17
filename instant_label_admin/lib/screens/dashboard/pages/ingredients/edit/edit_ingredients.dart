import 'package:flutter/material.dart';
import 'package:instant_label/config/constants/constant_size.dart';
import 'package:instant_label/config/widget/app_card_widget.dart';
import 'package:instant_label/config/widget/form_constraint_widget.dart';
import 'package:instant_label/config/widget/page_body.dart';
import 'package:instant_label/screens/dashboard/pages/ingredients/ingredients_screen.dart';

class EditIngredientsScreen extends StatefulWidget {
  static const String routepath = 'edit';
  static const String path = '${IngredientsScreen.path}/$routepath';
  const EditIngredientsScreen({super.key});

  @override
  State<EditIngredientsScreen> createState() => _EditIngredientsScreenState();
}

class _EditIngredientsScreenState extends State<EditIngredientsScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _ingreName = TextEditingController();

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
                        onPressed:(){},
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
