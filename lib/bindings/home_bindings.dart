import 'package:get/get.dart';
import 'package:opportunity_app/controller/apply_controller.dart';
import 'package:opportunity_app/controller/category_controller.dart';
import 'package:opportunity_app/controller/company_profile_controller.dart';
import 'package:opportunity_app/controller/free_category_controller.dart';
import 'package:opportunity_app/controller/report_controller.dart';
import 'package:opportunity_app/core/services/services.dart';
import '../controller/free_job_controller.dart';
import '../controller/home_controller.dart';
import '../controller/job_controller.dart';
import '../controller/user_profile_controller.dart';
import '../core/constants/app_keys.dart';

class HomeBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(FreeCategoryControllerImp());
    Get.put(JobCategoryControllerImp());
    Get.put(UserProfileControllerImp());
    Get.put(FreeJobControllerImp());
    Get.put(CompanyProfileControllerImp());
    Get.put(JobControllerImp());
    var applyController = Get.put(ApplyControllerImp());
    var reportController = Get.put(ReportControllerImp());

    if (Get.find<MyServices>().getString(AppKeys.role) == 'USER') {
      applyController.getAllDataByUserProfileId();
      reportController.getAllDataByUserProfileId();
    }

    Get.put(HomeControllerImp());
  }
}
