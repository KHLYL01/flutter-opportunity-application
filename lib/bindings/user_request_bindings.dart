import 'package:get/get.dart';
import 'package:opportunity_app/controller/apply_controller.dart';

class UserRequestBindings extends Bindings {
  @override
  void dependencies() {
    Get.find<ApplyControllerImp>().getAllDataByUserProfileId();
  }
}
