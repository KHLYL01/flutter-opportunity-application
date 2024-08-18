import 'package:get/get.dart';
import 'package:opportunity_app/controller/category_controller.dart';
import 'package:opportunity_app/controller/shared/image_controller.dart';
import '../controller/company_profile_controller.dart';
import '../controller/job_controller.dart';
import '../controller/shared/drop_down_controller.dart';

class CompanyProfileBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(CompanyProfileControllerImp()).getCompanyProfile();
    Get.put(ImageController());
    Get.put(JobControllerImp()).getAllDataByCompanyUserId();
    Get.put(
      DropDownController([
        '...',
        'Male',
        'Female',
      ], '...'),
      tag: 'Gender',
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
        tag: 'Nationality');

    Get.put(
        DropDownController([
          '...',
          'Full Time',
          'Part Time',
          'Temporary Contract',
          'Training',
        ], '...'),
        tag: 'Job Type');

    Get.put(
        DropDownController([
          '...',
          'Fresh Graduate',
          '1-2 Years',
          '2-3 Years',
          '3-5 Years',
          '5+ Years',
        ], '...'),
        tag: 'Experience');

    Get.put(
      DropDownController([
        'On Side',
        'Remotely',
      ], 'On Side'),
      tag: 'Online',
    );
    Get.put(
      DropDownController(
          Get.find<JobCategoryControllerImp>().getJobCategoryName(), '...'),
      tag: 'Category',
    );
    Get.put(
      DropDownController(['...'], '...'),
      tag: 'Sub Category',
    );
  }
}
