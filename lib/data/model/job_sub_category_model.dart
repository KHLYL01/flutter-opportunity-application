class JobSubCategoryModel {
  final int id;
  final int jobCategoryId;
  final String name;

  final String createdDate;

  JobSubCategoryModel({
    required this.id,
    required this.jobCategoryId,
    required this.name,
    required this.createdDate,
  });

  factory JobSubCategoryModel.zero() {
    return JobSubCategoryModel(
        id: 0, jobCategoryId: 0, name: '', createdDate: '');
  }

  factory JobSubCategoryModel.fromJson(Map<String, dynamic> json) {
    return JobSubCategoryModel(
      id: json['id'],
      jobCategoryId: json['jobCategory']['id'],
      name: json['name'],
      createdDate: json['createdDate'],
    );
  }

  static List<JobSubCategoryModel> map(var response) {
    return response
        .map((var json) => JobSubCategoryModel.fromJson(json))
        .cast<JobSubCategoryModel>()
        .toList();
  }
}
