class UserProfileModel {
  final int id;
  final int userId;
  final int? age;
  final String name;
  final String? gender;
  final String? educationalLevel;
  final String? specialty;
  final String? nationality;
  final String? location;
  final String? imageUrl;
  final String? pdfUrl;
  final String? ratingCompanyIds;
  final String? createdDate;

  UserProfileModel({
    required this.id,
    required this.userId,
    required this.age,
    required this.name,
    required this.gender,
    required this.educationalLevel,
    required this.specialty,
    required this.nationality,
    required this.location,
    required this.imageUrl,
    required this.pdfUrl,
    required this.ratingCompanyIds,
    required this.createdDate,
  });

  factory UserProfileModel.zero() {
    return UserProfileModel(
      id: 0,
      userId: 0,
      age: 0,
      name: '',
      gender: '',
      educationalLevel: '',
      specialty: '',
      nationality: '',
      location: '',
      imageUrl: '',
      pdfUrl: '',
      ratingCompanyIds: '',
      createdDate: '',
    );
  }

  factory UserProfileModel.fromJson(Map<String, dynamic> json) {
    return UserProfileModel(
      id: json['id'],
      userId: json['userId'],
      name: json['name'],
      age: json['age'],
      gender: json['gender'],
      educationalLevel: json['educationalLevel'],
      specialty: json['specialty'],
      nationality: json['nationality'],
      location: json['location'],
      imageUrl: json['image_url'],
      pdfUrl: json['pdf_url'],
      ratingCompanyIds: json['ratingCompanyIds'],
      createdDate: json['createdDate'],
    );
  }

  static List<UserProfileModel> map(var response) {
    return response
        .map((var json) => UserProfileModel.fromJson(json))
        .cast<UserProfileModel>()
        .toList();
  }
}
