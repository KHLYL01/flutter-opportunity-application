import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:opportunity_app/controller/sub_category_controller.dart';
import 'package:opportunity_app/core/extensions/widget_extension.dart';

import '../../../../core/enums/input_status.dart';
import '../../../../core/functions/validate_input.dart';
import '../../widget/text_field.dart';
import '../../widget/fill_button.dart';

class AddSubCategoryPage extends GetView<JobSubCategoryControllerImp> {
  const AddSubCategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    var passData = Get.arguments;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Form(
            key: controller.formState,
            child: ListView(
              children: [
                Text(
                  'Add Sub Category',
                  style: Theme.of(context).textTheme.displaySmall,
                ).center().paddingOnly(top: 170, bottom: 30),
                CustomTextField(
                  title: 'sub category',
                  hint: 'any sub category',
                  textEditingController: controller.name,
                  textInputType: TextInputType.name,
                  validator: (String? value) => validateInput(
                    input: value!,
                    inputStatus: InputStatus.none,
                  ),
                ),
                CustomFillButton(
                  width: context.width,
                  text: 'Add',
                  textFont: 24,
                  onPressed: () {
                    controller.postDate(passData[0]);
                  },
                ).paddingSymmetric(horizontal: 30, vertical: 40),
              ],
            ).paddingAll(20),
          ).makeSafeArea(),
        ],
      ),
    );
  }
}
