import 'package:instant_label_user/config/constants/constant.dart';
import 'package:instant_label_user/config/widgets/apicall_widget.dart';
import 'package:instant_label_user/screens/product_details/controller/model/product_api.dart';

class ProductControllerAPI {
  static Future<ProductAPI> getProduct(String barcode) async {
    Map<String, String> body = {
      'barcode': barcode,
    };
    dynamic response =
        await APIHttp('${BASE_URL}product-details/product-by-barcode')
            .postRequest(body);
    ProductAPI api = ProductAPI.fromJson(response);
    print(api);
    return api;
  }
}
