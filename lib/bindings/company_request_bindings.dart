import 'package:get/get.dart';
import 'package:opportunity_app/controller/apply_controller.dart';

import '../controller/user_profile_controller.dart';

class CompanyRequestBindings extends Bindings {
  @override
  void dependencies() {
    Get.find<ApplyControllerImp>().getAllDataByCompanyProfileId();
    Get.put(UserProfileControllerImp());
  }
}
