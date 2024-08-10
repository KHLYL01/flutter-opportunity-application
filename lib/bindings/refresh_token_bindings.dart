import 'package:get/get.dart';
import 'package:opportunity_app/controller/auth/refresh_token_controller.dart';

class RefreshTokenBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(RefreshTokenControllerImp());
  }
}
