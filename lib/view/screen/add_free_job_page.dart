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

class AddFreeJobPage extends GetView<UserProfileControllerImp> {
  const AddFreeJobPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Free Job"),
        centerTitle: true,
      ),
      body: GetBuilder<UserProfileControllerImp>(
        builder: (controller) => ListView(
          children: [
            CustomTextField(
              title: 'Title',
              hint: 'Enter your title',
              textEditingController: TextEditingController(),
              validator: (value) {},
            ),
            CustomTextField(
              title: 'Description',
              hint: 'Enter your description',
              textEditingController: TextEditingController(),
              validator: (value) {},
            ),
            const CustomDropDown(
              title: 'Free Category',
              currentSelected: '...',
              list: ['...', '1', '2', '3...'],
            ),
            CustomTextField(
              title: 'Contact Url',
              hint: 'Enter your whats app Url or ...',
              textEditingController: TextEditingController(),
              validator: (value) {},
            ),
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
