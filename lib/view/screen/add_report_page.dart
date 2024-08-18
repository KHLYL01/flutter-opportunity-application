import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:opportunity_app/controller/company_profile_controller.dart';
import 'package:opportunity_app/controller/report_controller.dart';
import 'package:opportunity_app/controller/shared/image_controller.dart';
import 'package:opportunity_app/core/extensions/widget_extension.dart';
import 'package:opportunity_app/core/functions/get_image_use_bottom_sheet.dart';

import '../../core/enums/input_status.dart';
import '../../core/functions/validate_input.dart';
import '../widget/fill_button.dart';
import '../widget/text_field.dart';

class AddReportPage extends GetView<ReportControllerImp> {
  const AddReportPage({super.key});
  @override
  Widget build(BuildContext context) {
    ImageController imageController = Get.find();

    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
              key: controller.formState,
              child: ListView(
                children: [
                  Text('Create Report',
                          style: Theme.of(context).textTheme.displaySmall)
                      .center()
                      .paddingOnly(top: 40, bottom: 50),
                  CustomTextField(
                    title: 'Cause',
                    hint: 'fill the field ',
                    textEditingController: controller.cause,
                    textInputType: TextInputType.name,
                    validator: (String? value) => validateInput(
                      input: value!,
                      inputStatus: InputStatus.none,
                    ),
                  ),
                  CustomTextField(
                    title: 'Details',
                    hint: 'Enter reporting details',
                    textEditingController: controller.details,
                    textInputType: TextInputType.text,
                    validator: (String? value) => validateInput(
                      input: value!,
                      inputStatus: InputStatus.none,
                    ),
                  ).paddingOnly(bottom: 40),
                  Obx(
                    () => Container(
                      height: 300,
                      width: 400,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey[300],
                      ),
                      child: imageController.selectedImagePath.value == ''
                          ? const Center(
                              child: Text(
                                'upload an image',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 30),
                              ),
                            )
                          : Image.file(
                              File(imageController.selectedImagePath.value),
                              fit: BoxFit.cover,
                            ),
                    ).onTap(() {
                      getImageUseBottomSheet(imageController);
                    }).paddingOnly(bottom: 20),
                  ),
                  CustomFillButton(
                    width: context.width,
                    text: 'Report',
                    textFont: 24,
                    onPressed: () {
                      controller.postDate(
                          Get.find<CompanyProfileControllerImp>()
                              .companyProfile
                              .id);
                    },
                  ).paddingSymmetric(horizontal: 30),
                ],
              ).marginAll(20))
          .makeSafeArea(),
    );
  }
}
