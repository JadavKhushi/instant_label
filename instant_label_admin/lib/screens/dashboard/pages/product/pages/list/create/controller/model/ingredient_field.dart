// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:instant_label/screens/dashboard/pages/ingredients/controller/model/ingredient_api.dart';

class IngredientField {
  final IngredientController ingredientController;

  IngredientField({
    required this.ingredientController,
  });
}

class IngredientController {
  final TextEditingController ingreWeightValue;
  final TextEditingController ingreWeightUnit;
  IngredientAPIData? selectedIngre;
  final TextEditingController ingreExtra;

   IngredientController({required this.ingreWeightValue, required this.ingreWeightUnit, required this.selectedIngre, required this.ingreExtra,});
}


// if (_formKey.currentState!.validate()) {

//         for (IngredientField element in ingredientField) {
//           print( element.ingredientController.selectedIngre?.ingredientsId);
//           print("-----");
//         }