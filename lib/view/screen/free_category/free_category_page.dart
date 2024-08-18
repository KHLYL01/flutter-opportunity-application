import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:opportunity_app/controller/free_category_controller.dart';
import 'package:opportunity_app/core/class/view_handle.dart';
import 'package:opportunity_app/core/constants/app_routes.dart';

import '../../widget/category_card.dart';

class FreeCategoriesPage extends StatelessWidget {
  const FreeCategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Free Categories'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(AppRoutes.addFreeCategoryPage);
        },
        child: const Icon(Icons.add),
      ),
      body: GetBuilder<FreeCategoryControllerImp>(
        builder: (controller) => ViewHandle(
          onPressed: () => controller.getAllData(),
          statusRequest: controller.statusRequest,
          widget: ListView.builder(
            itemCount: controller.length,
            itemBuilder: (context, index) {
              var item = controller.freeCategories[index];
              return CategoryCard(
                category: item.name,
                onDelete: () {
                  controller.deleteDate(item.id);
                },
                onEdit: () {
                  controller.toUpdateData(item);
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
