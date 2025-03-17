class BasicResponseAPI {
  bool? status;
  String? message;

  BasicResponseAPI({this.status, this.message});

  BasicResponseAPI.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['status'] = status;
    data['message'] = message;
    return data;
  }
}
