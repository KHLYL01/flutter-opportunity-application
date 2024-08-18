import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:opportunity_app/controller/category_controller.dart';
import 'package:opportunity_app/core/extensions/widget_extension.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/enums/input_status.dart';
import '../../../../core/functions/validate_input.dart';
import '../../widget/fill_button.dart';
import '../../widget/text_field.dart';

class AddCategoryPage extends GetView<JobCategoryControllerImp> {
  const AddCategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Form(
            key: controller.formState,
            child: ListView(
              children: [
                Text(
                  'Add Category',
                  style: Theme.of(context).textTheme.displaySmall,
                ).center().paddingOnly(top: 20, bottom: 10),
                const Icon(
                  Icons.category,
                  size: 100,
                  color: AppColors.myDarkBlue,
                ).paddingOnly(bottom: 20),
                CustomTextField(
                  title: 'category',
                  hint: 'Enter a category',
                  textEditingController: controller.name,
                  textInputType: TextInputType.name,
                  validator: (String? value) => validateInput(
                    input: value!,
                    inputStatus: InputStatus.none,
                  ),
                ).paddingOnly(bottom: 80),
                CustomFillButton(
                  width: context.width,
                  text: 'Add',
                  textFont: 24,
                  onPressed: () {
                    controller.postDate();
                  },
                ).paddingSymmetric(horizontal: 30),
              ],
            ).paddingAll(20),
          ).makeSafeArea(),
        ],
      ),
    );
  }
}
