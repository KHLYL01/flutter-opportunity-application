class JobCategoryModel {
  final int id;
  final String name;
  final String createdDate;

  JobCategoryModel({
    required this.id,
    required this.name,
    required this.createdDate,
  });

  factory JobCategoryModel.zero() {
    return JobCategoryModel(id: 0, name: '', createdDate: '');
  }

  factory JobCategoryModel.fromJson(Map<String, dynamic> json) {
    return JobCategoryModel(
        id: json['id'], name: json['name'], createdDate: json['createdDate']);
  }

  static List<JobCategoryModel> map(var response) {
    return response
        .map((var json) => JobCategoryModel.fromJson(json))
        .cast<JobCategoryModel>()
        .toList();
  }
}
