import 'package:get/get.dart';
import '../controller/pdf_file_controller.dart';

class PdfFileBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(PdfFileController());
  }
}
