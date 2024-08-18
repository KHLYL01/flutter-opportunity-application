import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:opportunity_app/controller/category_controller.dart';
import 'package:opportunity_app/controller/shared/drop_down_controller.dart';
import 'package:opportunity_app/controller/sub_category_controller.dart';
import 'package:opportunity_app/core/enums/input_status.dart';
import 'package:opportunity_app/core/functions/validate_input.dart';
import 'package:opportunity_app/view/widget/fill_button.dart';
import 'package:opportunity_app/view/widget/text_field.dart';

import '../../../controller/job_controller.dart';
import '../../widget/drop_down.dart';

class AddJobPage extends StatelessWidget {
  const AddJobPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Job"),
        centerTitle: true,
      ),
      body: GetBuilder<JobControllerImp>(
        builder: (controller) => Form(
          key: controller.formState,
          child: ListView(
            children: [
              CustomTextField(
                title: 'Title',
                hint: 'Enter your title',
                textEditingController: controller.title,
                validator: (value) =>
                    validateInput(input: value!, inputStatus: InputStatus.none),
              ),
              CustomTextField(
                title: 'Description',
                hint: 'Enter your description',
                textEditingController: controller.description,
                validator: (value) =>
                    validateInput(input: value!, inputStatus: InputStatus.none),
              ),
              CustomTextField(
                title: 'Age',
                hint: 'Enter Age',
                textEditingController: controller.age,
                textInputType: TextInputType.number,
                validator: (value) =>
                    validateInput(input: value!, inputStatus: InputStatus.none),
              ),
              CustomTextField(
                title: 'Location',
                hint: 'Enter your Location',
                textEditingController: controller.location,
                validator: (value) =>
                    validateInput(input: value!, inputStatus: InputStatus.none),
              ),
              const CustomDropDown(title: 'Gender'),
              const CustomDropDown(title: 'Nationality'),
              const CustomDropDown(title: 'Job Type'),
              const CustomDropDown(title: 'Experience'),
              const CustomDropDown(title: 'Online'),
              CustomDropDown(
                title: 'Category',
                onChange: (String? value) async {
                  Get.find<DropDownController>(tag: 'Category')
                      .onChange(value!);
                  int id = Get.find<JobCategoryControllerImp>()
                      .getJobCategoryId(value);
                  JobSubCategoryControllerImp cont =
                      Get.put(JobSubCategoryControllerImp());
                  await cont.getAllDataByCategoryIdForDropDown(id);
                  Get.find<DropDownController>(tag: 'Sub Category')
                    ..list.value = cont.getJobSubCategoryName()
                    ..currentSelected.value = '...';
                },
              ),
              const CustomDropDown(title: 'Sub Category'),
              CustomFillButton(
                width: context.width,
                text:
                    'expiryDate: ${controller.expiryDate.toString().substring(0, 10)}',
                onPressed: () async {
                  DateTime? date = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime.now().add(
                      const Duration(days: 365),
                    ),
                  );
                  if (date != null) {
                    controller.expiryDate = date;
                    controller.update();
                  }
                },
              ).paddingOnly(top: 20),
              CustomFillButton(
                width: context.width,
                text: 'Add Job',
                onPressed: () {
                  controller.postDate();
                },
              ).paddingOnly(top: 20),
            ],
          ).paddingSymmetric(horizontal: 10, vertical: 10),
        ),
      ),
    );
  }
}
