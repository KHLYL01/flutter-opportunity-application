import 'package:get/get.dart';

import '../controller/free_category_controller.dart';

class FreeCategoryBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(FreeCategoryControllerImp());
  }
}
