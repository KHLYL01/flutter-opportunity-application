import 'package:get/get.dart';
import '../controller/category_controller.dart';

class JobCategoryBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(JobCategoryControllerImp());
  }
}
