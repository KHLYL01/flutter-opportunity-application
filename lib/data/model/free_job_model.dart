import 'package:opportunity_app/data/model/free_category_model.dart';

class FreeJobModel {
  final int id;
  final String title;
  final String description;
  final String url;
  // final UserProfileModel userProfile;
  final FreeCategoryModel freeCategory;
  final String createdDate;

  FreeJobModel({
    required this.id,
    required this.title,
    required this.description,
    required this.url,
    // required this.userProfile,
    required this.freeCategory,
    required this.createdDate,
  });

  factory FreeJobModel.zero() {
    return FreeJobModel(
      id: 0,
      title: '',
      description: '',
      url: '',
      // userProfile: UserProfileModel.zero(),
      freeCategory: FreeCategoryModel.zero(),
      createdDate: '',
    );
  }

  factory FreeJobModel.fromJson(Map<String, dynamic> json) {
    return FreeJobModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      url: json['url'],
      // userProfile: UserProfileModel.fromJson(json['userProfile']),
      freeCategory: FreeCategoryModel.fromJson(json['freeCategory']),
      createdDate: json['createdDate'],
    );
  }

  static List<FreeJobModel> map(var response) {
    return response
        .map((var json) => FreeJobModel.fromJson(json))
        .cast<FreeJobModel>()
        .toList();
  }
}
