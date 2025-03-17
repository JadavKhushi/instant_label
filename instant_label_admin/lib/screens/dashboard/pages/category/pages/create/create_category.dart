import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:instant_label/config/constants/constant_size.dart';
import 'package:instant_label/config/widget/app_card_widget.dart';
import 'package:instant_label/config/widget/form_constraint_widget.dart';
import 'package:instant_label/config/widget/page_body.dart';
import 'package:instant_label/screens/dashboard/pages/category/category_screen.dart';
import 'package:instant_label/screens/dashboard/pages/category/controller/api/category_controller_api.dart';
import 'package:instant_label/config/widget/dialog/api_calling_dialog.dart';

class CreateCategory extends StatefulWidget {
  static const String routepath = 'create';
  static const String path = '${CategoryScreen.path}/$routepath';
  const CreateCategory({super.key});

  @override
  State<CreateCategory> createState() => _CreateCategoryState();
}

class _CreateCategoryState extends State<CreateCategory> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _categoryName = TextEditingController();

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      APICallDialog(
        context,
        future: CategoryControllerAPI.createCategory(_categoryName.text),
        onSuccess: (data) {
          Future.delayed(
            const Duration(milliseconds: 300),
            () {
              context.go(CategoryScreen.path);
            },
          );
          return const SizedBox();
        },
      ).create();
    }
  }

  @override
  void dispose() {
    _categoryName.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageBody(
      title: 'Create Category',
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
                        controller: _categoryName,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(Space_XS),
                            ),
                          ),
                          label: Text('Category Name'),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please Enter Category!';
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
