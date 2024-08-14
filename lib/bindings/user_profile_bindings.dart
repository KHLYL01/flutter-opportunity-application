import 'package:get/get.dart';
import 'package:opportunity_app/controller/image_controller.dart';
import '../controller/home_controller.dart';
import '../controller/user_profile_controller.dart';

class UserProfileBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(UserProfileControllerImp());
    Get.put(ImageController());
  }
}
