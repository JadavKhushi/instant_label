class CategoryAPI {
  bool? status;
  String? message;
  List<CategoryAPIData>? data;

  CategoryAPI({this.status, this.message, this.data});

  CategoryAPI.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <CategoryAPIData>[];
      json['data'].forEach((v) {
        data!.add( CategoryAPIData.fromJson(v));
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

class CategoryAPIData {
  int? categoryId;
  String? name;

  CategoryAPIData({this.categoryId, this.name});

  CategoryAPIData.fromJson(Map<String, dynamic> json) {
    categoryId = json['category_id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['category_id'] = categoryId;
    data['name'] = name;
    return data;
  }

}
