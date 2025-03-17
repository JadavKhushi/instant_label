class IngredientAPI {
  bool? status;
  String? message;
  List<IngredientAPIData>? data;

  IngredientAPI({this.status, this.message, this.data});

  IngredientAPI.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <IngredientAPIData>[];
      json['data'].forEach((v) {
        data!.add(IngredientAPIData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class IngredientAPIData {
  int? ingredientsId;
  String? ingredients;

  IngredientAPIData({this.ingredientsId, this.ingredients});

  IngredientAPIData.fromJson(Map<String, dynamic> json) {
    ingredientsId = json['ingredients_id'];
    ingredients = json['ingredients'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['ingredients_id'] = ingredientsId;
    data['ingredients'] = ingredients;
    return data;
  }
}
