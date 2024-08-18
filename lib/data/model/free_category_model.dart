class FreeCategoryModel {
  final int id;
  final String name;
  final String createdDate;

  FreeCategoryModel({
    required this.id,
    required this.name,
    required this.createdDate,
  });

  factory FreeCategoryModel.zero() {
    return FreeCategoryModel(id: 0, name: '', createdDate: '');
  }

  factory FreeCategoryModel.fromJson(Map<String, dynamic> json) {
    return FreeCategoryModel(
        id: json['id'], name: json['name'], createdDate: json['createdDate']);
  }

  static List<FreeCategoryModel> map(var response) {
    return response
        .map((var json) => FreeCategoryModel.fromJson(json))
        .cast<FreeCategoryModel>()
        .toList();
  }
}
