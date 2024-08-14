import 'dart:developer';
import 'dart:io';

import 'package:get/get.dart';
import 'package:pdfx/pdfx.dart';
import 'package:http/http.dart' as http;

class PdfFileController extends GetxController {
  late PdfControllerPinch pdfControllerPinch;

  RxBool isLoading = true.obs;

  @override
  void onInit() async {
    pdfControllerPinch = PdfControllerPinch(
        document: PdfDocument.openFile(
      '/data/user/0/com.example.opportunity_app/cache/file_picker/1723593794964/proforma_invoice.pdf',
    ));

    // online
    // final file = await http.get(
    //   Uri.parse("${AppLink.files}/$id"),
    //   headers: {
    //     'Authorization': 'Bearer ${myServices.getToken()}',
    //   },
    // );
    // pdfControllerPinch = PdfControllerPinch(
    //   document: PdfDocument.openData(
    //     file.bodyBytes,
    //   ),
    // );

    isLoading(false);

    super.onInit();
  }

  @override
  void onClose() {
    pdfControllerPinch.dispose();
    super.onClose();
  }
}
