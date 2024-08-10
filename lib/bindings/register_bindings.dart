import 'package:get/get.dart';
import 'package:opportunity_app/controller/auth/register_controller.dart';

class RegisterBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(RegisterControllerImp());
  }
}
