import '../../../core/class/crud.dart';
import '../../../link_api.dart';

class AuthData {
  Crud crud;
  AuthData(this.crud);

  registerData({
    required String name,
    required String email,
    required String password,
    required String phoneNumber,
    required String role,
  }) async {
    Map<String, dynamic> body = {
      "name": name,
      "email": email,
      "password": password,
      "phoneNumber": phoneNumber,
      "role": role,
    };
    var response = await crud.postDataWithoutToken(AppLink.register, body);
    return response.fold((l) => l, (r) => r);
  }

  loginData({
    required String email,
    required String password,
  }) async {
    Map<String, dynamic> body = {
      "email": email,
      "password": password,
    };
    var response = await crud.postDataWithoutToken(AppLink.login, body);
    return response.fold((l) => l, (r) => r);
  }

  refreshData({
    required String refreshToken,
  }) async {
    Map<String, dynamic> body = {"refreshToken": refreshToken};
    var response = await crud.postDataWithoutToken(AppLink.refreshToken, body);
    return response.fold((l) => l, (r) => r);
  }

  userData() async {
    var response = await crud.getAllData(AppLink.admin);
    return response.fold((l) => l, (r) => r);
  }

  updateUserData(int id) async {
    var response = await crud.updateData("${AppLink.admin}/$id");
    return response.fold((l) => l, (r) => r);
  }

  deleteUserData(int id) async {
    var response = await crud.deleteData("${AppLink.admin}/$id");
    return response.fold((l) => l, (r) => r);
  }
}
