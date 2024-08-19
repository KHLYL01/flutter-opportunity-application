class UserModel {
  final int id;
  final String name;
  final String email;
  final String phoneNumber;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phoneNumber,
  });

  factory UserModel.zero() {
    return UserModel(
      id: 0,
      name: '',
      email: '',
      phoneNumber: '',
    );
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phoneNumber: json['phoneNumber'],
    );
  }

  static List<UserModel> map(var response) {
    return response
        .map((var json) => UserModel.fromJson(json))
        .cast<UserModel>()
        .toList();
  }
}
