import 'package:get/get.dart';
import 'package:opportunity_app/controller/auth/register_controller.dart';

import '../controller/shared/drop_down_controller.dart';

class RegisterBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(RegisterControllerImp());
    Get.put(
        DropDownController(
          ['USER', 'COMPANY', 'ADMIN'],
          'USER',
        ),
        tag: 'Role');
  }
}
