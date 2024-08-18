class ReportModel {
  final int id;
  final int companyProfileId;
  final int userProfileId;
  final String cause;
  final String details;
  final String imageUrl;
  final String createdDate;

  ReportModel({
    required this.id,
    required this.companyProfileId,
    required this.userProfileId,
    required this.cause,
    required this.details,
    required this.imageUrl,
    required this.createdDate,
  });

  factory ReportModel.zero() {
    return ReportModel(
      id: 0,
      companyProfileId: 0,
      userProfileId: 0,
      cause: '',
      details: '',
      imageUrl: '',
      createdDate: '',
    );
  }

  factory ReportModel.fromJson(Map<String, dynamic> json) {
    return ReportModel(
      id: json['id'],
      companyProfileId: json['companyProfileId'],
      userProfileId: json['userProfile']['id'],
      cause: json['cause'],
      details: json['details'],
      imageUrl: json['imageUrl'],
      createdDate: json['createdDate'],
    );
  }

  static List<ReportModel> map(var response) {
    return response
        .map((var json) => ReportModel.fromJson(json))
        .cast<ReportModel>()
        .toList();
  }
}
