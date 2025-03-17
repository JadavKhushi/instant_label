import 'package:instant_label/config/constants/constant.dart';
import 'package:instant_label/config/model/basic_response_api.dart';
import 'package:instant_label/config/widget/apicall_widget.dart';
import 'package:instant_label/screens/dashboard/pages/product/pages/list/create/controller/model/pro_input_data.dart';

class ProductControllerAPI {
  static Future<BasicResponseAPI> createProduct(ProductReqAPI req) async {
    Map<String, String> body = {
      'product_name': req.proName,
      'product_barcode': req.barcodeNum,
      'product_category': req.categoryId.toString(),
      'product_weight_unit': req.proWeightUnit,
      'product_weight_value': req.proWeightVal,
      'product_nutrition_weight': req.proNutritionWeight,
      'ingredients_data': req.ingredientsData.toString(),
    };

    if(req.calorie != null) body['calories_val'] =  req.calorie ?? "";
    if(req.sugar != null) body['sugar_val'] =  req.sugar?? "";
    if(req.protien != null) body['protien_val'] = req.protien ?? "";
    if(req.carbs != null) body['carbs_val'] = req.carbs ?? "";
    if(req.fat != null) body['fat_val'] = req.fat ?? "";
    if(req.fiber != null) body['fiber_val'] = req.fiber??"";
    if(req.cholestrol != null) body['cholesterol_val'] = req.cholestrol ?? "";
    if(req.sodium != null) body['sodium_val'] = req.sodium ?? "";
    if(req.alcohol != null) body['alcohol_val'] = req.alcohol ?? "";
    if(req.iron != null) body['iron_val'] = req.iron ?? "";
    if(req.magnesium != null) body['magnesium_val'] = req.magnesium ?? "";
    if(req.phosphorus != null) body['phosphorus_val'] = req.phosphorus ?? "";
    if(req.potassium != null) body['potassium_val'] = req.potassium ?? "";
    if(req.copper != null) body['copper_val'] = req.copper ?? "";
    if(req.selenium != null) body['selenium_val'] = req.selenium ?? "";
    if(req.vitA != null) body['vitA_val'] = req.vitA ?? "";
    if(req.vitB1 != null) body['vitB1_val'] = req.vitB1 ?? "";
    if(req.vitB2 != null) body['vitB2_val'] = req.vitB2 ?? "";
    if(req.vitB6 != null) body['vitB6_val'] = req.vitB6 ?? "";
    if(req.vitB12 != null) body['vitB12_val'] = req.vitB12 ?? "";
    if(req.vitC != null) body['vitC_val'] = req.vitC ?? "";
    if(req.vitD != null) body['vitD_val'] = req.vitD ?? "";
    if(req.vitE != null) body['vitE_val'] = req.vitE ?? "";



    dynamic response = await APIHttp('${BASE_URL}product-details/add-product')
        .postRequest(body);
    BasicResponseAPI api = BasicResponseAPI.fromJson(response);
    return api;
  }
}
