import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:instant_label/config/constants/constant_colours.dart';
import 'package:instant_label/config/constants/constant_size.dart';
import 'package:instant_label/config/model/unit.dart';
import 'package:instant_label/config/widget/apicall_widget.dart';
import 'package:instant_label/config/widget/app_card_widget.dart';
import 'package:instant_label/config/widget/dialog/api_calling_dialog.dart';
import 'package:instant_label/config/widget/form_constraint_widget.dart';
import 'package:instant_label/config/widget/page_body.dart';
import 'package:instant_label/screens/dashboard/pages/category/controller/api/category_controller_api.dart';
import 'package:instant_label/screens/dashboard/pages/category/controller/model/category_api.dart';
import 'package:instant_label/screens/dashboard/pages/ingredients/controller/api/ingredient_controller_api.dart';
import 'package:instant_label/screens/dashboard/pages/ingredients/controller/model/ingredient_api.dart';
import 'package:instant_label/screens/dashboard/pages/product/pages/list/create/controller/api/product_controller_api.dart';
import 'package:instant_label/screens/dashboard/pages/product/pages/list/create/controller/model/ingredient_field.dart';
import 'package:instant_label/screens/dashboard/pages/product/pages/list/create/controller/model/pro_input_data.dart';
import 'package:instant_label/screens/dashboard/pages/product/pages/list/list_screen.dart';
import 'package:instant_label/screens/dashboard/pages/product/product_screen.dart';

class CreateProduct extends StatelessWidget {
  static const String routepath = 'create';
  static const String path = '${ListScreen.path}/$routepath';
  const CreateProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return APICallWidget<CategoryAPI>(
      future: CategoryControllerAPI.getCategory(),
      onSuccess: (data) {
        if (data.status ?? false) {
          return APICallWidget(
            future: IngredientControllerAPI.getIngredient(),
            onSuccess: (dataIng) {
              if (dataIng.status ?? false) {
                return CreateProductFormWidget(
                    categoryList: data.data ?? [], ingList: dataIng.data ?? []);
              } else {
                return const SizedBox();
              }
            },
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}

class CreateProductFormWidget extends StatefulWidget {
  final List<CategoryAPIData> categoryList;
  final List<IngredientAPIData> ingList;
  const CreateProductFormWidget(
      {super.key, required this.categoryList, required this.ingList});

  @override
  State<CreateProductFormWidget> createState() =>
      _CreateProductFormWidgetState();
}

class _CreateProductFormWidgetState extends State<CreateProductFormWidget> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _productName = TextEditingController();
  final _barcodeNo = TextEditingController();
  CategoryAPIData? _selectedCategory; //CategoryItem.FastFood;
  final _productWeightValue = TextEditingController(text: '100');
  final _productWeightUnit = TextEditingController(text: 'g');

  List<IngredientField> ingredientField = [];

  final _proNutritionWeight = TextEditingController(text: '100');
  final _caloriesVal = TextEditingController(text: '0');
  final _fatVal = TextEditingController(text: '0');
  final _sugarVal = TextEditingController(text: '0');
  final _protienVal = TextEditingController(text: '0');
  final _carbsVal = TextEditingController(text: '0');
  final _fiberVal = TextEditingController(text: '0');
  final _cholesterolVal = TextEditingController(text: '0');
  final _sodiumVal = TextEditingController(text: '0');
  final _alcoholVal = TextEditingController(text: '0');
  final _ironVal = TextEditingController(text: '0');
  final _magnesiumVal = TextEditingController(text: '0');
  final _phosphorusVal = TextEditingController(text: '0');
  final _potassiumVal = TextEditingController(text: '0');
  final _copperVal = TextEditingController(text: '0');
  final _seleniumVal = TextEditingController(text: '0');
  final _vitAVal = TextEditingController(text: '0');
  final _vitB1Val = TextEditingController(text: '0');
  final _vitB2Val = TextEditingController(text: '0');
  final _vitB6Val = TextEditingController(text: '0');
  final _vitB12Val = TextEditingController(text: '0');
  final _vitCVal = TextEditingController(text: '0');
  final _vitDval = TextEditingController(text: '0');
  final _vitEVal = TextEditingController(text: '0');
  String? errorCate;

  @override
  void dispose() {
    _productName.dispose();
    _barcodeNo.dispose();
    _productWeightValue.dispose();
    _productWeightUnit.dispose();
    _proNutritionWeight.dispose();
    _caloriesVal.dispose();
    _fatVal.dispose();
    _sugarVal.dispose();
    _protienVal.dispose();
    _carbsVal.dispose();
    _fiberVal.dispose();
    _cholesterolVal.dispose();
    _sodiumVal.dispose();
    _alcoholVal.dispose();
    _ironVal.dispose();
    _magnesiumVal.dispose();
    _phosphorusVal.dispose();
    _potassiumVal.dispose();
    _copperVal.dispose();
    _seleniumVal.dispose();
    _vitAVal.dispose();
    _vitB1Val.dispose();
    _vitB2Val.dispose();
    _vitB6Val.dispose();
    _vitB12Val.dispose();
    _vitCVal.dispose();
    _vitDval.dispose();
    _vitEVal.dispose();

    for (IngredientField element in ingredientField) {
      element.ingredientController.ingreWeightUnit.dispose();
      element.ingredientController.ingreWeightValue.dispose();
      element.ingredientController.ingreExtra.dispose();
    }

    super.dispose();
  }

  @override
  void initState() {
    _selectedCategory = null;
    ingredientField.add(getIngredientField());
    super.initState();
  }

  IngredientField getIngredientField() {
    final ingreWeightValue = TextEditingController();
    final ingreWeightUnit = TextEditingController(text: 'g');
    IngredientAPIData? selectedIngreController;
    final ingreExtraController = TextEditingController();
    return IngredientField(
      ingredientController: IngredientController(
        ingreWeightUnit: ingreWeightUnit,
        ingreWeightValue: ingreWeightValue,
        selectedIngre: selectedIngreController,
        ingreExtra: ingreExtraController,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return PageBody(
      title: 'Create Product',
      child: AppCardWidget(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: FormConstraintWidget(
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    const SizedBox(height: Space_L),
                    InputWidget(
                      controller: _productName,
                      label: const Text('Product Name'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please Enter Product Name!';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: Space_L),
                    InputWidget(
                      controller: _barcodeNo,
                      label: const Text(
                        'Barcode Number',
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please Enter Barcode Number';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: Space_L),
                    //row of Pro weight and unit
                    Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: InputWidget(
                            controller: _productWeightValue,
                            label: const Text('Weight of Product'),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please Enter Product Weight!';
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(width: Space_S),
                        Expanded(
                          child: InputWidget(
                            controller: _productWeightUnit,
                            label: const Text('Unit'),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please Enter Product Weight Unit!';
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: Space_L),

                    //Category of Product
                    DropdownButtonFormField(
                      decoration: const InputDecoration(
                        label: Text('Category Of Product'),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(Space_XS),
                          ),
                        ),
                      ),
                      value: _selectedCategory,
                      items: widget.categoryList
                          .map(
                            (category) => DropdownMenuItem(
                              value: category,
                              child: Text(
                                category.name.toString(),
                              ),
                            ),
                          )
                          .toList(),
                      onChanged: (value) {
                        if (value == null) {
                          return;
                        }
                        setState(() {
                          _selectedCategory = value;
                        });
                      },
                    ),
                    const SizedBox(height: Space_L),

                    //Ingredient Section
                    const Text(
                      'Ingredients',
                      style:
                          TextStyle(fontSize: FontSize_L, color: PRIMARY_COLOR),
                    ),
                    const SizedBox(width: Space_L),
                    const SizedBox(width: Space_L),

                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return ingredientFieldWidget(
                            ingredientField[index],
                            ingredientField[index]
                                .ingredientController
                                .selectedIngre);
                      },
                      itemCount: ingredientField.length,
                    ),
                    /////////////////
                    TextButton(
                      onPressed: () {
                        setState(() {
                          ingredientField.add(getIngredientField());
                        });
                      },
                      child: const Text('Add One More Ingredient'),
                    ),

                    const SizedBox(height: Space_L),
                    //Nutrition Section
                    const Text(
                      'Nutritions',
                      style: TextStyle(fontSize: FontSize_L),
                    ),
                    const SizedBox(height: Space_L),
                    NutritionWidget(
                      name: 'Nutrition Information per',
                      controller: _proNutritionWeight,
                    ),
                    const SizedBox(height: Space_S),
                    NutritionWidget(
                      name: 'Calories/Energy',
                      controller: _caloriesVal,
                    ),
                    const SizedBox(height: Space_S),
                    NutritionWidget(
                      name: 'Sugar',
                      controller: _sugarVal,
                    ),
                    const SizedBox(height: Space_S),
                    NutritionWidget(
                      name: 'Protien',
                      controller: _protienVal,
                    ),
                    const SizedBox(height: Space_S),
                    NutritionWidget(
                      name: 'Carbohydrates',
                      controller: _carbsVal,
                    ),
                    const SizedBox(height: Space_S),
                    NutritionWidget(
                      name: 'Fat',
                      controller: _fatVal,
                    ),
                    const SizedBox(height: Space_S),
                    NutritionWidget(
                      name: 'Fiber',
                      controller: _fiberVal,
                    ),
                    const SizedBox(height: Space_S),
                    NutritionWidget(
                      name: 'Cholesterol',
                      controller: _cholesterolVal,
                    ),
                    const SizedBox(height: Space_S),
                    NutritionWidget(
                      name: 'Sodium/Salt',
                      controller: _sodiumVal,
                    ),
                    const SizedBox(height: Space_S),
                    NutritionWidget(
                      name: 'Alcohol',
                      controller: _alcoholVal,
                    ),
                    const SizedBox(height: Space_S),
                    NutritionWidget(
                      name: 'Iron',
                      controller: _ironVal,
                      appUnit: AppUnit.mg,
                    ),
                    const SizedBox(height: Space_S),
                    NutritionWidget(
                      name: 'Magnesium',
                      controller: _magnesiumVal,
                      appUnit: AppUnit.mg,
                    ),
                    const SizedBox(height: Space_S),
                    NutritionWidget(
                      name: 'Phosphorus',
                      controller: _phosphorusVal,
                      appUnit: AppUnit.mg,
                    ),
                    const SizedBox(height: Space_S),
                    NutritionWidget(
                      name: 'Potassium',
                      controller: _potassiumVal,
                      appUnit: AppUnit.mg,
                    ),
                    const SizedBox(height: Space_S),
                    NutritionWidget(
                      name: 'Copper',
                      controller: _copperVal,
                      appUnit: AppUnit.mg,
                    ),
                    const SizedBox(height: Space_S),
                    NutritionWidget(
                      name: 'Selenium',
                      controller: _seleniumVal,
                      appUnit: AppUnit.mg,
                    ),
                    const SizedBox(height: Space_S),
                    NutritionWidget(
                      name: 'Vitamin A',
                      controller: _vitAVal,
                      appUnit: AppUnit.mcg,
                    ),
                    const SizedBox(height: Space_S),
                    NutritionWidget(
                      name: 'Vitamin B1',
                      controller: _vitB1Val,
                      appUnit: AppUnit.mcg,
                    ),
                    const SizedBox(height: Space_S),
                    NutritionWidget(
                      name: 'Vitamin B2',
                      controller: _vitB2Val,
                      appUnit: AppUnit.mcg,
                    ),
                    const SizedBox(height: Space_S),
                    NutritionWidget(
                      name: 'Vitamin B6',
                      controller: _vitB6Val,
                      appUnit: AppUnit.mcg,
                    ),
                    const SizedBox(height: Space_S),
                    NutritionWidget(
                      name: 'Vitamin B12',
                      controller: _vitB12Val,
                      appUnit: AppUnit.mcg,
                    ),
                    const SizedBox(height: Space_S),
                    NutritionWidget(
                      name: 'Vitamin C',
                      controller: _vitCVal,
                      appUnit: AppUnit.mcg,
                    ),
                    const SizedBox(height: Space_S),
                    NutritionWidget(
                      name: 'Vitamin D',
                      controller: _vitDval,
                      appUnit: AppUnit.mcg,
                    ),
                    const SizedBox(height: Space_S),
                    NutritionWidget(
                      name: 'Vitamin E',
                      controller: _vitEVal,
                      appUnit: AppUnit.mcg,
                    ),
                    const SizedBox(height: Space_S),

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
      ),
    );
  }

  Widget ingredientFieldWidget(
    IngredientField ingredientField,
    IngredientAPIData? selectedIngre,
  ) {
    IngredientAPIData? selectedIngre =
        ingredientField.ingredientController.selectedIngre;
    return Column(
      children: [
        const SizedBox(width: Space_L),
        DropdownButtonFormField(
          decoration: InputDecoration(
            label: const Text('Ingredient of product'),
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(Space_XS),
              ),
            ),
            errorText: errorCate,
          ),
          value: selectedIngre,
          items: widget.ingList
              .map(
                (ingre) => DropdownMenuItem(
                  value: ingre,
                  child: Text(
                    ingre.ingredients.toString(),
                  ),
                ),
              )
              .toList(),
          onChanged: (value) {
            if (value == null) {
              return;
            }
            setState(() {
              selectedIngre = value;
            });
          },
        ),
        const SizedBox(height: Space_L),
        Row(
          children: [
            Expanded(
              child: InputWidget(
                // initialValue: '0',
                suffix: const Text('%', style: TextStyle(fontSize: FontSize_R)),
                controller:
                    ingredientField.ingredientController.ingreWeightValue,
                label: const Text('Weight of Ingredient'),
              ),
            ),
            const SizedBox(width: Space_S),
            Expanded(
              child: InputWidget(
                controller:
                    ingredientField.ingredientController.ingreWeightUnit,
                label: const Text('Unit'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please Enter Ingredient Weight Unit!';
                  }
                  return null;
                },
              ),
            ),
          ],
        ),
        const SizedBox(height: Space_L),
        InputWidget(
          controller: ingredientField.ingredientController.ingreExtra,
          label: const Text('Extra Ingredient Name'),
        ),
        const SizedBox(height: Space_L),
        const Divider(
          color: PRIMARY_COLOR,
          height: 1,
          thickness: 2,
        ),
        const SizedBox(height: Space_L),
      ],
    );
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      if (_selectedCategory != null) {
        errorCate = null;
      } else {
        errorCate = "Please select category";
        return;
      }
      _formKey.currentState!.save(); // Save the form data

      List<String> ingredients = [];
      for (IngredientField element in ingredientField) {
        IngredientsReqAPI ingre = IngredientsReqAPI(
          ingredientId:
              element.ingredientController.selectedIngre?.ingredientsId,
          proIngreWeightUnit:
              element.ingredientController.ingreWeightUnit.text.trim(),
          proIngreWeightVal:
              element.ingredientController.ingreWeightValue.text.trim(),
          proExtraIngre: element.ingredientController.ingreExtra.text.trim(),
        );
        ingredients.add(ingre.toString());
      }

      ProductReqAPI api = ProductReqAPI(
        proName: _productName.text.trim(),
        barcodeNum: _barcodeNo.text.trim(),
        categoryId: _selectedCategory!.categoryId ?? -1,
        proWeightUnit: _productWeightUnit.text.trim(),
        proWeightVal: _productWeightValue.text.trim(),
        ingredientsData: ingredients,
        proNutritionWeight: _proNutritionWeight.text.trim(),
        calorie: _caloriesVal.text.trim(),
        fat: _fatVal.text.trim(),
        sugar: _sugarVal.text.trim(),
        protien: _protienVal.text.trim(),
        carbs: _carbsVal.text.trim(),
        fiber: _fiberVal.text.trim(),
        cholestrol: _cholesterolVal.text.trim(),
        sodium: _sodiumVal.text.trim(),
        alcohol: _alcoholVal.text.trim(),
        iron: _ironVal.text.trim(),
        magnesium: _magnesiumVal.text.trim(),
        phosphorus: _phosphorusVal.text.trim(),
        potassium: _potassiumVal.text.trim(),
        copper: _copperVal.text.trim(),
        selenium: _seleniumVal.text.trim(),
        vitA: _vitAVal.text.trim(),
        vitB1: _vitB1Val.text.trim(),
        vitB2: _vitB2Val.text.trim(),
        vitB6: _vitB6Val.text.trim(),
        vitB12: _vitB12Val.text.trim(),
        vitC: _vitCVal.text.trim(),
        vitD: _vitDval.text.trim(),
        vitE: _vitEVal.text.trim(),
      );
      APICallDialog(
        context,
        future: ProductControllerAPI.createProduct(api),
        onSuccess: (data) {
          Future.delayed(
            const Duration(milliseconds: 300),
            () {
              context.go(ProductScreen.path);
            },
          );
          return const SizedBox();
        },
      ).create();
    }
  }
}

// ignore: must_be_immutable
class InputWidget extends StatelessWidget {
  final TextEditingController controller;
  Widget? label;
  String? Function(String?)? validator;
  String? initialValue;
  Widget? suffix;
  TextInputType? keyboardType;
  InputWidget({
    super.key,
    required this.controller,
    this.label,
    this.validator,
    this.initialValue,
    this.suffix,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      initialValue: initialValue,
      controller: controller,
      decoration: InputDecoration(
        suffix: suffix,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(Space_XS),
          ),
        ),
        label: label,
      ),
      validator: validator,
    );
  }
}

class NutritionWidget extends StatelessWidget {
  final String name;
  final TextEditingController controller;
  final AppUnit appUnit;

  const NutritionWidget(
      {super.key,
      required this.name,
      required this.controller,
      this.appUnit = AppUnit.g});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Text(
            name,
            style: const TextStyle(fontSize: FontSize_R),
          ),
        ),
        Expanded(
          child: InputWidget(
            controller: controller,
            suffix: Text(appUnit.title),
            keyboardType: TextInputType.number,
          ),
        ),
      ],
    );
  }
}
