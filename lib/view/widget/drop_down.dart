import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:opportunity_app/controller/shared/drop_down_controller.dart';

import '../../core/constants/app_colors.dart';

class CustomDropDown extends StatelessWidget {
  const CustomDropDown({
    Key? key,
    required this.title,
    this.onChange,
  }) : super(key: key);

  final String title;
  final ValueChanged<String?>? onChange;

  @override
  Widget build(BuildContext context) {
    DropDownController controller = Get.find<DropDownController>(tag: title);
    return SizedBox(
      width: context.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ).paddingOnly(bottom: 10),
          Container(
            width: context.width,
            decoration: const BoxDecoration(
              color: AppColors.filledColor,
              border: Border(
                bottom: BorderSide(color: Colors.black54),
              ),
            ),
            child: Obx(
              () {
                return DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: controller.currentSelected.value,
                    items: controller.list
                        .map(
                          (item) => DropdownMenuItem<String>(
                            value: item,
                            child: Text(item),
                          ),
                        )
                        .toList(),
                    onChanged: onChange ??
                        (String? value) {
                          controller.onChange(value!);
                        },
                  ).paddingSymmetric(horizontal: 16),
                );
              },
            ),
          ),
        ],
      ),
    ).paddingOnly(bottom: 10);
  }
}
