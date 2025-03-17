import 'package:flutter/material.dart';
import 'package:instant_label/config/constants/constant_size.dart';
import 'package:instant_label/config/widget/app_card_widget.dart';
import 'package:instant_label/config/widget/form_constraint_widget.dart';
import 'package:instant_label/config/widget/page_body.dart';
import 'package:instant_label/screens/dashboard/pages/category/category_screen.dart';

class EditCategoryScreen extends StatefulWidget {
   static const String routepath = 'edit';
  static const String path = '${CategoryScreen.path}/$routepath';
  const EditCategoryScreen({super.key});

  @override
  State<EditCategoryScreen> createState() => _EditCategoryScreenState();
}

class _EditCategoryScreenState extends State<EditCategoryScreen> {
  
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _categoryName = TextEditingController();

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
                        onPressed: (){},
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