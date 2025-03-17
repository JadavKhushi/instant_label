class ProductReqAPI {
  final String proName;
  final String barcodeNum;
  final int categoryId;
  final String proWeightVal;
  final String proWeightUnit;
  final List<String> ingredientsData;
  final String proNutritionWeight;
  final String? calorie;
  final String? fat;
  final String? sugar;
  final String? protien;
  final String? carbs;
  final String? fiber;
  final String? cholestrol;
  final String? sodium;
  final String? alcohol;
  final String? iron;
  final String? magnesium;
  final String? phosphorus;
  final String? potassium;
  final String? copper;
  final String? selenium;
  final String? vitA;
  final String? vitB1;
  final String? vitB2;
  final String? vitB6;
  final String? vitB12;
  final String? vitC;
  final String? vitD;
  final String? vitE;

  ProductReqAPI({
    required this.proName,
    required this.barcodeNum,
    required this.categoryId,
    required this.proWeightVal,
    required this.proWeightUnit,
    required this.ingredientsData,
    required this.proNutritionWeight,
    this.calorie,
    this.fat,
    this.sugar,
    this.protien,
    this.carbs,
    this.fiber,
    this.cholestrol,
    this.sodium,
    this.alcohol,
    this.iron,
    this.magnesium,
    this.phosphorus,
    this.potassium,
    this.copper,
    this.selenium,
    this.vitA,
    this.vitB1,
    this.vitB2,
    this.vitB6,
    this.vitB12,
    this.vitC,
    this.vitD,
    this.vitE,
  });
}

class IngredientsReqAPI {
  final int? ingredientId;
  final String proIngreWeightUnit;
  final String proIngreWeightVal;
  final String? proExtraIngre;

  IngredientsReqAPI({
    required this.ingredientId,
    required this.proIngreWeightUnit,
    required this.proIngreWeightVal,
    required this.proExtraIngre,
  });

  @override
  String toString() {
    return '{"ingredients_id": "$ingredientId", "product_ingredients_weight_unit": "$proIngreWeightUnit", "product_ingredients_weight_value": "$proIngreWeightVal", "product_ingredients_extra": "$proExtraIngre"}';
  }
}
