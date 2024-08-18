import 'package:get/get.dart';
import 'package:opportunity_app/controller/shared/image_controller.dart';

class AddReportBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(ImageController());
  }
}
