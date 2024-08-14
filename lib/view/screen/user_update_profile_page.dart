import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:opportunity_app/controller/user_profile_controller.dart';
import 'package:opportunity_app/core/constants/app_images.dart';
import 'package:opportunity_app/core/extensions/widget_extension.dart';
import 'package:opportunity_app/view/widget/drop_down.dart';
import 'package:opportunity_app/view/widget/fill_button.dart';
import 'package:opportunity_app/view/widget/outline_button.dart';
import 'package:opportunity_app/view/widget/text_field.dart';

import '../../controller/image_controller.dart';
import '../../core/functions/get_image_use_bottom_sheet.dart';

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
        builder: (controller) => ListView(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.black54, width: 2)),
                  child: imageController.selectedImagePath.value == ''
                      ? const CircleAvatar(
                          radius: 64,
                          backgroundImage: AssetImage(AppImages.welcome),
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
              textEditingController: TextEditingController(),
              validator: (value) {},
            ),
            CustomTextField(
              title: 'Age',
              hint: 'Enter your Age',
              textEditingController: TextEditingController(),
              validator: (value) {},
            ),
            const CustomDropDown(
              title: 'Gender',
              currentSelected: '...',
              list: ['...', 'Male', 'Female'],
            ),
            const CustomDropDown(
              title: 'Nationality',
              currentSelected: '...',
              list: [
                '...',
                'Algerian',
                'Bahraini',
                'Comorian',
                'Djiboutian',
                'Egyptian',
                'Iraqi',
                'Jordanian',
                'Kuwaiti',
                'Lebanese',
                'Libyan',
                'Mauritanian',
                'Moroccan',
                'Omani',
                'Palestinian',
                'Qatari',
                'Saudi',
                'Somali',
                'Sudanese',
                'Syrian',
                'Tunisian',
                'Emirati',
                'Yemeni',
              ],
            ),
            const CustomDropDown(
              title: 'Educational Level',
              currentSelected: '...',
              list: [
                '...',
                'secondary education certificate',
                'Associate degree (undergraduate)',
                'Bachelor’s degree (undergraduate)',
                'Master’s degree (graduate)',
                'Doctoral degree (graduate)',
              ],
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
                  : 'Add File',
            ).center(),
            CustomFillButton(
              width: context.width,
              text: 'Update Profile',
              onPressed: () {},
            ).paddingOnly(top: 20),
          ],
        ).paddingSymmetric(horizontal: 10, vertical: 10),
      ),
    );
  }
}
