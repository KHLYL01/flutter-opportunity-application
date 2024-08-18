class CompanyProfileModel {
  final int id;
  final int userId;
  final int reviewCount;
  final double totalRate;
  final String name;
  final String? scope;
  final String? imageUrl;
  final String? createdDate;

  CompanyProfileModel({
    required this.id,
    required this.userId,
    required this.reviewCount,
    required this.totalRate,
    required this.scope,
    required this.imageUrl,
    required this.name,
    required this.createdDate,
  });

  factory CompanyProfileModel.zero() {
    return CompanyProfileModel(
      id: 0,
      userId: 0,
      reviewCount: 0,
      totalRate: 0,
      name: '',
      scope: '',
      imageUrl: '',
      createdDate: '',
    );
  }

  factory CompanyProfileModel.fromJson(Map<String, dynamic> json) {
    return CompanyProfileModel(
      id: json['id'],
      userId: json['userId'],
      reviewCount: json['reviewCount'],
      totalRate: json['totalRate'],
      name: json['name'],
      scope: json['scope'],
      imageUrl: json['imageUrl'],
      createdDate: json['createdDate'],
    );
  }

  static List<CompanyProfileModel> map(var response) {
    return response
        .map((var json) => CompanyProfileModel.fromJson(json))
        .cast<CompanyProfileModel>()
        .toList();
  }
}
