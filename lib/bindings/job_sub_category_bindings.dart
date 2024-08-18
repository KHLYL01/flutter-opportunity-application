import 'package:get/get.dart';
import '../controller/sub_category_controller.dart';

class JobSubCategoryBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(JobSubCategoryControllerImp());
  }
}
