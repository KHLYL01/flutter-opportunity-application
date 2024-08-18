import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:opportunity_app/controller/free_job_controller.dart';
import 'package:opportunity_app/core/enums/input_status.dart';
import 'package:opportunity_app/core/functions/validate_input.dart';
import 'package:opportunity_app/view/widget/fill_button.dart';
import 'package:opportunity_app/view/widget/text_field.dart';

import '../../widget/drop_down.dart';

class AddFreeJobPage extends StatelessWidget {
  const AddFreeJobPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Free Job"),
        centerTitle: true,
      ),
      body: GetBuilder<FreeJobControllerImp>(
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
                title: 'Contact Url',
                hint: 'Enter your whats app Url or ...',
                textEditingController: controller.url,
                validator: (value) => null,
              ),
              const CustomDropDown(
                title: 'Free Category',
              ),
              CustomFillButton(
                width: context.width,
                text: 'Add Free Job',
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
