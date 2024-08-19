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
import '../controller/rate_controller.dart';
import '../controller/shared/drop_down_controller.dart';
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
    Get.put(RateControllerImp());

    var applyController = Get.put(ApplyControllerImp());
    var reportController = Get.put(ReportControllerImp());

    if (Get.find<MyServices>().getString(AppKeys.role) == 'USER') {
      applyController.getAllDataByUserProfileId();
      reportController.getAllDataByUserProfileId();
    }

    if (Get.find<MyServices>().getString(AppKeys.role) == 'ADMIN') {
      applyController.getAllDataByUserProfileId();
      reportController.getAllData();
    }

    Get.put(HomeControllerImp());

    Get.put(
      DropDownController([
        '...',
        'Male',
        'Female',
      ], '...'),
      tag: 'Search Gender',
    );
    Get.put(
        DropDownController([
          '...',
          'Algerian',
          'Bahraini',
          'Comorian',
          'Djiboutian',
          'Egyptian',
          'Iraqi',
          'Jordanian',
          'Kuwaiti',
          'Lebanese',
          'Libyan',
          'Mauritanian',
          'Moroccan',
          'Omani',
          'Palestinian',
          'Qatari',
          'Saudi',
          'Somali',
          'Sudanese',
          'Syrian',
          'Tunisian',
          'Emirati',
          'Yemeni',
        ], '...'),
        tag: 'Search Nationality');

    Get.put(
        DropDownController([
          '...',
          'Full Time',
          'Part Time',
          'Temporary Contract',
          'Training',
        ], '...'),
        tag: 'Search Job Type');

    Get.put(
        DropDownController([
          '...',
          'Fresh Graduate',
          '1-2 Years',
          '2-3 Years',
          '3-5 Years',
          '5+ Years',
        ], '...'),
        tag: 'Search Experience');

    Get.put(
      DropDownController([
        '...',
        'On Side',
        'Remotely',
      ], '...'),
      tag: 'Search Online',
    );
  }
}
