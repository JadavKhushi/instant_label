import 'package:instant_label/config/constants/constant.dart';
import 'package:instant_label/config/widget/apicall_widget.dart';
import 'package:instant_label/screens/dashboard/pages/category/controller/model/category_api.dart';

class CategoryControllerAPI {
  static Future<CategoryAPI> getCategory() async {
    dynamic response =
        await APIHttp('${BASE_URL}product-details/category').getRequest();
    CategoryAPI api = CategoryAPI.fromJson(response);
    return api;
  }

  static Future<CategoryAPI> createCategory(String name) async {
    Map<String, String> body = {
      'category_name': name,
    };

    dynamic response =
        await APIHttp('${BASE_URL}product-details/category/create')
            .postRequest(body);
    CategoryAPI api = CategoryAPI.fromJson(response);
    return api;
  }
}

