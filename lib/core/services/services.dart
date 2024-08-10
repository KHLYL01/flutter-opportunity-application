import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyServices extends GetxService {
  late SharedPreferences sharedPreferences;

  Future<MyServices> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
    return this;
  }

  Future<void> saveString(String key, String value) async {
    await sharedPreferences.setString(key, value);
  }

  Future<void> saveInt(String key, int value) async {
    await sharedPreferences.setInt(key, value);
  }

  String getString(String key) {
    return sharedPreferences.getString(key) ?? 'Not Found Key';
  }

  int getInt(String key) {
    return sharedPreferences.getInt(key) ?? -1;
  }

  String getToken() {
    return sharedPreferences.getString('token') ?? '';
  }

  String getRefreshToken() {
    return sharedPreferences.getString('refresh') ?? '';
  }
}

initialServices() async {
  await Get.putAsync(
    () => MyServices().init(),
  );
}
