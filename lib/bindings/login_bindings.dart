import 'package:get/get.dart';
import 'package:opportunity_app/controller/login_controller.dart';
import 'package:opportunity_app/controller/register_controller.dart';

class LoginBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(LoginControllerImp());
  }
}
