import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:opportunity_app/core/class/view_handle.dart';
import 'package:opportunity_app/core/constants/app_routes.dart';

import '../../../../controller/sub_category_controller.dart';
import '../../widget/category_card.dart';

class SubCategoriesPage extends GetView<JobSubCategoryControllerImp> {
  const SubCategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    var passData = Get.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text('${passData[1]}'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(AppRoutes.addSubCategoryPage, arguments: [passData[0]]);
        },
        child: const Icon(Icons.add),
      ),
      body: GetBuilder<JobSubCategoryControllerImp>(
        builder: (controller) => ViewHandle(
          onPressed: () => controller.getAllData(),
          statusRequest: controller.statusRequest,
          widget: ListView.builder(
            itemCount: controller.length,
            itemBuilder: (context, index) {
              var item = controller.subCategories[index];
              return CategoryCard(
                category: item.name,
                onDelete: () {
                  controller.deleteDate(item.id);
                },
                onEdit: () {
                  controller.toUpdateData(item);
                  Get.toNamed(
                    AppRoutes.updateSubCategoryPage,
                    arguments: [passData[0]],
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
