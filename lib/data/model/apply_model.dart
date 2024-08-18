class ApplyModel {
  final int id;
  final int userProfileId;
  final String userProfileName;
  final String? userProfileImageUrl;
  final String? userProfileSpecialty;
  final int jobId;
  final String jobTitle;
  final int companyId;
  final String? companyImageUrl;
  final String companyName;
  final String status;
  final String createdDate;

  ApplyModel({
    required this.id,
    required this.userProfileId,
    required this.userProfileName,
    required this.userProfileImageUrl,
    required this.userProfileSpecialty,
    required this.jobId,
    required this.status,
    required this.createdDate,
    required this.jobTitle,
    required this.companyId,
    required this.companyImageUrl,
    required this.companyName,
  });

  factory ApplyModel.zero() {
    return ApplyModel(
      id: 0,
      userProfileId: 0,
      userProfileName: '',
      userProfileImageUrl: '',
      userProfileSpecialty: '',
      jobId: 0,
      jobTitle: '',
      status: '',
      createdDate: '',
      companyId: 0,
      companyImageUrl: '',
      companyName: '',
    );
  }

  factory ApplyModel.fromJson(Map<String, dynamic> json) {
    return ApplyModel(
      id: json['id'],
      userProfileId: json['userProfile']['id'],
      userProfileName: json['userProfile']['user']['name'],
      userProfileImageUrl: json['userProfile']['image_url'],
      userProfileSpecialty: json['userProfile']['specialty'],
      jobId: json['job']['id'],
      jobTitle: json['job']['title'],
      companyId: json['job']['companyProfile']['id'],
      companyName: json['job']['companyProfile']['user']['name'],
      companyImageUrl: json['job']['companyProfile']['imageUrl'],
      status: json['status'],
      createdDate: json['createdDate'],
    );
  }

  static List<ApplyModel> map(var response) {
    return response
        .map((var json) => ApplyModel.fromJson(json))
        .cast<ApplyModel>()
        .toList();
  }
}
