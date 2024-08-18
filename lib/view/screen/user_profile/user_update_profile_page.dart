import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:opportunity_app/controller/user_profile_controller.dart';
import 'package:opportunity_app/core/class/view_handle.dart';
import 'package:opportunity_app/core/enums/input_status.dart';
import 'package:opportunity_app/core/extensions/widget_extension.dart';
import 'package:opportunity_app/core/functions/validate_input.dart';
import 'package:opportunity_app/view/widget/drop_down.dart';
import 'package:opportunity_app/view/widget/fill_button.dart';
import 'package:opportunity_app/view/widget/outline_button.dart';
import 'package:opportunity_app/view/widget/text_field.dart';

import '../../../../controller/shared/image_controller.dart';
import '../../../../core/functions/get_image_use_bottom_sheet.dart';
import '../../../../link_api.dart';

class UserUpdateProfilePage extends GetView<UserProfileControllerImp> {
  const UserUpdateProfilePage({super.key});
  @override
  Widget build(BuildContext context) {
    ImageController imageController = Get.find();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Update Profile"),
        centerTitle: true,
      ),
      body: GetBuilder<UserProfileControllerImp>(
        builder: (controller) => ViewHandle(
          onPressed: () => controller.updateUserProfile(),
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
                        ? controller.userProfile.imageUrl == null
                            ? CircleAvatar(
                                radius: 64,
                                child: Text(
                                  controller.userProfile.name[0],
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
                                  '${AppLink.images}/image/${controller.userProfile.imageUrl!}',
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
                title: 'Specialize',
                hint: 'Enter your Specialize',
                textEditingController: controller.specialize,
                validator: (value) => validateInput(
                  input: value!,
                  inputStatus: InputStatus.none,
                ),
              ),
              CustomTextField(
                title: 'Age',
                hint: 'Enter your Age',
                textInputType: TextInputType.number,
                textEditingController: controller.age,
                validator: (value) => validateInput(
                  input: value!,
                  inputStatus: InputStatus.none,
                ),
              ),
              CustomTextField(
                title: 'Location',
                hint: 'Enter your Location',
                textEditingController: controller.location,
                validator: (value) => validateInput(
                  input: value!,
                  inputStatus: InputStatus.none,
                ),
              ),
              const CustomDropDown(
                title: 'Gender',
              ),
              const CustomDropDown(
                title: 'Nationality',
              ),
              const CustomDropDown(
                title: 'Educational Level',
              ),
              CustomOutlineButton(
                width: context.width,
                text: 'Add File',
                icon: Icons.attach_file_outlined,
                onPressed: () {
                  controller.selectFile();
                },
              ).paddingOnly(top: 20, bottom: 10),
              Text(
                controller.file != null
                    ? controller.file!.path
                    // .split('/').last
                    : controller.userProfile.pdfUrl == null
                        ? 'Add File'
                        : controller.userProfile.pdfUrl!.split('_').last,
              ).center(),
              CustomFillButton(
                width: context.width,
                text: 'Update Profile',
                onPressed: () {
                  controller.updateUserProfile();
                },
              ).paddingOnly(top: 20),
            ],
          ).paddingSymmetric(horizontal: 10, vertical: 10),
        ),
      ),
    );
  }
}
