import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:opportunity_app/core/class/view_handle.dart';
import 'package:opportunity_app/core/constants/app_routes.dart';
import 'package:opportunity_app/core/extensions/widget_extension.dart';

import '../../../../controller/category_controller.dart';
import '../../widget/category_card.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categories'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(AppRoutes.addCategoryPage);
        },
        child: const Icon(Icons.add),
      ),
      body: GetBuilder<JobCategoryControllerImp>(
        builder: (controller) => ViewHandle(
          onPressed: () => controller.getAllData(),
          statusRequest: controller.statusRequest,
          widget: ListView.builder(
            itemCount: controller.length,
            itemBuilder: (context, index) {
              var item = controller.categories[index];
              return CategoryCard(
                category: item.name,
                onDelete: () {
                  controller.deleteDate(item.id);
                },
                onEdit: () {
                  controller.toUpdateData(item);
                },
              ).onTap(
                () => Get.toNamed(
                  AppRoutes.subCategoryPage,
                  arguments: [item.id, item.name],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
