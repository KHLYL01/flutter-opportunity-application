import 'package:get/get.dart';
import 'package:opportunity_app/controller/auth/login_controller.dart';

class LoginBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(LoginControllerImp());
  }
}
