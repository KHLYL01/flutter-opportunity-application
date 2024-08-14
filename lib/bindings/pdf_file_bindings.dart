import 'package:get/get.dart';
import 'package:opportunity_app/controller/image_controller.dart';
import '../controller/home_controller.dart';
import '../controller/pdf_file_controller.dart';
import '../controller/user_profile_controller.dart';

class PdfFileBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(PdfFileController());
  }
}
