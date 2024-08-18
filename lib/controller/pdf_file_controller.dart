import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:opportunity_app/controller/user_profile_controller.dart';
import 'package:opportunity_app/core/services/services.dart';
import 'package:pdfx/pdfx.dart';

import '../link_api.dart';

class PdfFileController extends GetxController {
  late PdfControllerPinch pdfControllerPinch;

  RxBool isLoading = true.obs;
  MyServices myServices = Get.find();

  @override
  void onInit() async {
    // pdfControllerPinch = PdfControllerPinch(
    //     document: PdfDocument.openFile(
    //   '/data/user/0/com.example.opportunity_app/cache/file_picker/1723593794964/proforma_invoice.pdf',
    // ));

    // online
    final file = await http.get(
      Uri.parse(
        "${AppLink.images}/file/${Get.find<UserProfileControllerImp>().userProfile.pdfUrl}",
      ),
      headers: {
        'Authorization': 'Bearer ${myServices.getToken()}',
      },
    );
    pdfControllerPinch = PdfControllerPinch(
      document: PdfDocument.openData(
        file.bodyBytes,
      ),
    );

    isLoading(false);

    super.onInit();
  }

  @override
  void onClose() {
    pdfControllerPinch.dispose();
    super.onClose();
  }
}
