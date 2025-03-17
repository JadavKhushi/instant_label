class ProductAPI {
  bool? status;
  String? message;
  ProductAPIData? data;

  ProductAPI({this.status, this.message, this.data});

  ProductAPI.fromJson(Map<String, dynamic> json) {
    print("print 1");
    try {
      status = json['status'];
      message = json['message'];
      print("try ----------");
      data =
          json['data'] != null ? ProductAPIData.fromJson(json['data']) : null;
    } catch (e) {
      print(e);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class ProductAPIData {
  int? productId;
  String? productName;
  String? productBarcode;
  int? productCategory;
  String? productWeightValue;
  String? productWeightUnit;
  String? productNutritionWeight;
  String? caloriesVal;
  String? fatVal;
  String? sugarVal;
  String? protienVal;
  String? carbsVal;
  String? fiberVal;
  String? cholesterolVal;
  String? sodiumVal;
  String? alcoholVal;
  String? ironVal;
  String? magnesiumVal;
  String? phosphorusVal;
  String? potassiumVal;
  String? copperVal;
  String? seleniumVal;
  String? vitAVal;
  String? vitB1Val;
  String? vitB2Val;
  String? vitB6Val;
  String? vitB12Val;
  String? vitCVal;
  String? vitDVal;
  String? vitEVal;
  String? productStatus;
  String? status;
  String? createdAt;
  String? updatedAt;
  String? categoryName;
  List<Ingredients>? ingredients;

  ProductAPIData(
      {this.productId,
      this.productName,
      this.productBarcode,
      this.productCategory,
      this.productWeightValue,
      this.productWeightUnit,
      this.productNutritionWeight,
      this.caloriesVal,
      this.fatVal,
      this.sugarVal,
      this.protienVal,
      this.carbsVal,
      this.fiberVal,
      this.cholesterolVal,
      this.sodiumVal,
      this.alcoholVal,
      this.ironVal,
      this.magnesiumVal,
      this.phosphorusVal,
      this.potassiumVal,
      this.copperVal,
      this.seleniumVal,
      this.vitAVal,
      this.vitB1Val,
      this.vitB2Val,
      this.vitB6Val,
      this.vitB12Val,
      this.vitCVal,
      this.vitDVal,
      this.vitEVal,
      this.productStatus,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.categoryName,
      this.ingredients});

  ProductAPIData.fromJson(Map<String, dynamic> json) {
    print("try3---------- $json");
    print("try1 ----------");
    productId = json['product_id'];
    productName = json['product_name'];
    productBarcode = json['product_barcode'];
    print("try2 ----------");
    productCategory = json['product_category'];

    productWeightValue = json['product_weight_value'];
    productWeightUnit = json['product_weight_unit'];
    productNutritionWeight = json['product_nutrition_weight'];

    print("try15 ----------  ${json['calories_val']}");
    caloriesVal = json['calories_val'].toString();

    print("try11000000 ----------");
    fatVal =  json['fat_val'].toString();
    print("try11 ----------");
    sugarVal = json['sugar_val'].toString();
    protienVal = json['protien_val'].toString();
    print("try12 ----------");
    carbsVal = json['carbs_val'].toString();
    fiberVal = json['fiber_val'].toString();
    print("try13 ----------");
    cholesterolVal = json['cholesterol_val'].toString();
    sodiumVal = json['sodium_val'].toString();
    alcoholVal = json['alcohol_val'].toString();
    print("try4 ----------");
    ironVal = json['iron_val'].toString();
    magnesiumVal = json['magnesium_val'].toString();
    phosphorusVal = json['phosphorus_val'].toString();
    potassiumVal = json['potassium_val'].toString();
    copperVal = json['copper_val'].toString();
    seleniumVal = json['selenium_val'].toString();
    vitAVal = json['vitA_val'].toString();
    vitB1Val = json['vitB1_val'].toString();
    vitB2Val = json['vitB2_val'].toString();
    vitB6Val = json['vitB6_val'].toString();
    vitB12Val = json['vitB12_val'].toString();
    vitCVal = json['vitC_val'].toString();
    vitDVal = json['vitD_val'].toString();
    vitEVal = json['vitE_val'].toString();
    productStatus = json['product_status'].toString();
    status = json['status'].toString();
    createdAt = json['createdAt'].toString();
    updatedAt = json['updatedAt'].toString();
    categoryName = json['category_name'];
    print("try5 ----------");
    if (json['ingredients'] != null) {
      print("try6 ----------");
      ingredients = <Ingredients>[];
      json['ingredients'].forEach((v) {
        ingredients!.add(Ingredients.fromJson(v));
      });
      print("try7 ----------");
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['product_id'] = productId;
    data['product_name'] = productName;
    data['product_barcode'] = productBarcode;
    data['product_category'] = productCategory;
    data['product_weight_value'] = productWeightValue;
    data['product_weight_unit'] = productWeightUnit;
    data['product_nutrition_weight'] = productNutritionWeight;
    data['calories_val'] = caloriesVal;
    data['fat_val'] = fatVal;
    data['sugar_val'] = sugarVal;
    data['protien_val'] = protienVal;
    data['carbs_val'] = carbsVal;
    data['fiber_val'] = fiberVal;
    data['cholesterol_val'] = cholesterolVal;
    data['sodium_val'] = sodiumVal;
    data['alcohol_val'] = alcoholVal;
    data['iron_val'] = ironVal;
    data['magnesium_val'] = magnesiumVal;
    data['phosphorus_val'] = phosphorusVal;
    data['potassium_val'] = potassiumVal;
    data['copper_val'] = copperVal;
    data['selenium_val'] = seleniumVal;
    data['vitA_val'] = vitAVal;
    data['vitB1_val'] = vitB1Val;
    data['vitB2_val'] = vitB2Val;
    data['vitB6_val'] = vitB6Val;
    data['vitB12_val'] = vitB12Val;
    data['vitC_val'] = vitCVal;
    data['vitD_val'] = vitDVal;
    data['vitE_val'] = vitEVal;
    data['product_status'] = productStatus;
    data['status'] = status;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['category_name'] = categoryName;
    if (ingredients != null) {
      data['ingredients'] = ingredients!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Ingredients {
  int? productId;
  int? ingredientsId;
  String? ingredients;
  String? productIngredientsWeightUnit;
  String? productIngredientsWeightValue;
  String? productIngredientsExtra;

  Ingredients(
      {this.productId,
      this.ingredientsId,
      this.ingredients,
      this.productIngredientsWeightUnit,
      this.productIngredientsWeightValue,
      this.productIngredientsExtra});

  Ingredients.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    ingredientsId = json['ingredients_id'];
    ingredients = json['ingredients'];
    productIngredientsWeightUnit = json['product_ingredients_weight_unit'];
    productIngredientsWeightValue = json['product_ingredients_weight_value'];
    productIngredientsExtra = json['product_ingredients_extra'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['product_id'] = productId;
    data['ingredients_id'] = ingredientsId;
    data['ingredients'] = ingredients;
    data['product_ingredients_weight_unit'] = productIngredientsWeightUnit;
    data['product_ingredients_weight_value'] = productIngredientsWeightValue;
    data['product_ingredients_extra'] = productIngredientsExtra;
    return data;
  }
}
