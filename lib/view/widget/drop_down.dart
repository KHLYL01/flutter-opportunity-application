import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:opportunity_app/controller/drop_down_controller.dart';
import '../../core/constants/app_colors.dart';

class CustomDropDown extends StatelessWidget {
  const CustomDropDown({
    Key? key,
    required this.title,
    required this.currentSelected,
    required this.list,
  }) : super(key: key);

  final String title;
  final String currentSelected;
  final List<String> list;

  @override
  Widget build(BuildContext context) {
    DropDownController controller = DropDownController(list, currentSelected);
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
              () => DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: controller.currentSelected.value,
                  items: list
                      .map(
                        (item) => DropdownMenuItem(
                          value: item,
                          child: Text(item),
                        ),
                      )
                      .toList(),
                  onChanged: (String? value) {
                    controller.onChange(value!);
                  },
                ).paddingSymmetric(horizontal: 16),
              ),
            ),
          ),
        ],
      ),
    ).paddingOnly(bottom: 10);
  }
}
