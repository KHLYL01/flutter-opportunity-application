import 'package:get/get.dart';
import 'package:opportunity_app/controller/shared/image_controller.dart';
import '../controller/free_category_controller.dart';
import '../controller/shared/drop_down_controller.dart';
import '../controller/free_job_controller.dart';
import '../controller/user_profile_controller.dart';

class UserProfileBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(UserProfileControllerImp()).getUserProfile();
    Get.put(ImageController());
    Get.put(FreeJobControllerImp()).getAllDataByUserProfileId();
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
        'secondary education certificate',
        'Associate degree (undergraduate)',
        'Bachelor’s degree (undergraduate)',
        'Master’s degree (graduate)',
        'Doctoral degree (graduate)',
      ], '...'),
      tag: 'Educational Level',
    );
    Get.put(
      DropDownController(
          Get.find<FreeCategoryControllerImp>().getFreeCategoryName(), '...'),
      tag: 'Free Category',
    );
  }
}
