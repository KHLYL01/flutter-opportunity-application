import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:opportunity_app/core/extensions/widget_extension.dart';
import 'package:pdfx/pdfx.dart';

import '../../../controller/pdf_file_controller.dart';

class PdfFilePage extends GetView<PdfFileController> {
  const PdfFilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: Obx(
        () => controller.isLoading.value
            ? const CircularProgressIndicator().center()
            : PdfViewPinch(
                controller: controller.pdfControllerPinch,
              ),
      ),
    ).makeSafeArea();
  }
}
