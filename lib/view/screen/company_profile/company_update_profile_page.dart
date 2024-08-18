import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:opportunity_app/controller/company_profile_controller.dart';
import 'package:opportunity_app/core/class/view_handle.dart';
import 'package:opportunity_app/core/enums/input_status.dart';
import 'package:opportunity_app/core/extensions/widget_extension.dart';
import 'package:opportunity_app/core/functions/validate_input.dart';
import 'package:opportunity_app/view/widget/fill_button.dart';
import 'package:opportunity_app/view/widget/text_field.dart';

import '../../../../controller/shared/image_controller.dart';
import '../../../../core/functions/get_image_use_bottom_sheet.dart';
import '../../../../link_api.dart';

class CompanyUpdateProfilePage extends GetView<CompanyProfileControllerImp> {
  const CompanyUpdateProfilePage({super.key});
  @override
  Widget build(BuildContext context) {
    ImageController imageController = Get.find();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Update Profile"),
        centerTitle: true,
      ),
      body: GetBuilder<CompanyProfileControllerImp>(
        builder: (controller) => ViewHandle(
          onPressed: () => controller.updateCompanyProfile(),
          statusRequest: controller.statusRequest,
          widget: ListView(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.black54, width: 2)),
                    child: imageController.selectedImagePath.value == ''
                        ? controller.companyProfile.imageUrl == null
                            ? CircleAvatar(
                                radius: 64,
                                child: Text(
                                  controller.companyProfile.name[0],
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 34,
                                  ),
                                ),
                              )
                            : CircleAvatar(
                                radius: 64,
                                backgroundColor: Colors.blue,
                                backgroundImage: NetworkImage(
                                  '${AppLink.images}/image/${controller.companyProfile.imageUrl!}',
                                ),
                              )
                        : CircleAvatar(
                            radius: 64,
                            backgroundImage: FileImage(
                                File(imageController.selectedImagePath.value)),
                          ),
                  ),
                  Container(
                    width: 128,
                    height: 128,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(.3),
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      onPressed: () async {
                        await getImageUseBottomSheet(imageController);
                        controller.update();
                      },
                      icon: const Icon(
                        Icons.camera,
                        size: 32,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ).center(),
              CustomTextField(
                title: 'Scope',
                hint: 'Enter your Scope',
                textEditingController: controller.scope,
                validator: (value) => validateInput(
                  input: value!,
                  inputStatus: InputStatus.none,
                ),
              ),
              CustomFillButton(
                width: context.width,
                text: 'Update Profile',
                onPressed: () {
                  controller.updateCompanyProfile();
                },
              ).paddingOnly(top: 20),
            ],
          ).paddingSymmetric(horizontal: 10, vertical: 10),
        ),
      ),
    );
  }
}
