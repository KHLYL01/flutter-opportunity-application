class RateModel {
  final int id;
  final int userProfileId;
  final int companyProfileId;
  final double rate;
  final String createdDate;

  RateModel({
    required this.id,
    required this.userProfileId,
    required this.companyProfileId,
    required this.rate,
    required this.createdDate,
  });

  factory RateModel.zero() {
    return RateModel(
      id: 0,
      userProfileId: 0,
      companyProfileId: 0,
      rate: 0.0,
      createdDate: '',
    );
  }

  factory RateModel.fromJson(Map<String, dynamic> json) {
    return RateModel(
      id: json['id'],
      userProfileId: json['userProfileId'],
      companyProfileId: json['companyProfileId'],
      rate: json['rate'],
      createdDate: json['createdDate'],
    );
  }

  static List<RateModel> map(var response) {
    return response
        .map((var json) => RateModel.fromJson(json))
        .cast<RateModel>()
        .toList();
  }
}
