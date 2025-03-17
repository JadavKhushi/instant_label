class HistoryModelTable {
  final String barcode;
  final String name;
  final String category;
  final String image;

  const HistoryModelTable({
    required this.barcode,
    required this.name,
    required this.category,
    required this.image,
  });

  static HistoryModelTable format(Map<String, dynamic> json) {
    try {
      String barcode = json['barcode'];
      String name = json['proName'];
      String category = json['proCategory'];
      String image = json['proImage'];

      return HistoryModelTable(barcode: barcode, name: name, category: category, image: image,);
    } catch (e) {
      
      throw "Invalid Format";
    }
  }
}
