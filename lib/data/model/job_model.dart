class JobModel {
  final int id;
  final int age;
  final String title;
  final String description;
  final String nationality;
  final String gender;
  final String jopType;
  final String experience;
  final String location;
  final String expiryDate;
  final String jobSubCategoryName;
  final String online;
  final int companyId;
  final String companyName;
  final String? companyScope;
  final String? companyImageUrl;
  final String createdDate;

  JobModel({
    required this.id,
    required this.age,
    required this.title,
    required this.description,
    required this.nationality,
    required this.gender,
    required this.jopType,
    required this.experience,
    required this.location,
    required this.expiryDate,
    required this.jobSubCategoryName,
    required this.online,
    required this.companyId,
    required this.companyName,
    required this.companyScope,
    required this.companyImageUrl,
    required this.createdDate,
  });

  factory JobModel.zero() {
    return JobModel(
      id: 0,
      age: 0,
      title: '',
      description: '',
      nationality: '',
      gender: '',
      jopType: '',
      experience: '',
      location: '',
      expiryDate: '00000000000',
      jobSubCategoryName: '',
      online: '',
      companyId: 0,
      companyName: '',
      companyScope: '',
      companyImageUrl: '',
      createdDate: '00000000000',
    );
  }

  factory JobModel.fromJson(Map<String, dynamic> json) {
    return JobModel(
      id: json['id'],
      age: json['age'],
      title: json['title'],
      description: json['description'],
      nationality: json['nationality'],
      gender: json['gender'],
      jopType: json['jopType'],
      experience: json['experience'],
      location: json['location'],
      expiryDate: json['expiryDate'],
      jobSubCategoryName: json['jobSubCategory']['name'],
      online: json['online'],
      companyId: json['companyProfile']['id'],
      companyName: json['companyProfile']['user']['name'],
      companyScope: json['companyProfile']['scope'],
      companyImageUrl: json['companyProfile']['imageUrl'],
      createdDate: json['createdDate'],
    );
  }

  static List<JobModel> map(var response) {
    return response
        .map((var json) => JobModel.fromJson(json))
        .cast<JobModel>()
        .toList();
  }
}
