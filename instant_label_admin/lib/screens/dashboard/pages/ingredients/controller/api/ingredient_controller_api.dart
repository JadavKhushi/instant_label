import 'package:instant_label/config/constants/constant.dart';
import 'package:instant_label/config/widget/apicall_widget.dart';
import 'package:instant_label/screens/dashboard/pages/ingredients/controller/model/ingredient_api.dart';

class IngredientControllerAPI {
  static Future<IngredientAPI> getIngredient() async {
    dynamic response =
        await APIHttp('${BASE_URL}product-details/ingredients').getRequest();
    IngredientAPI api = IngredientAPI.fromJson(response);
    return api;
  }

  static Future<IngredientAPI> createIngredient(String name) async {
    Map<String, String> body = {
      'ingredients': name,
    };

    dynamic response =
        await APIHttp('${BASE_URL}product-details/ingredients/create')
            .postRequest(body);

    IngredientAPI api = IngredientAPI.fromJson(response);
    return api;
  }
}
