import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:opportunity_app/core/class/view_handle.dart';
import 'package:opportunity_app/core/constants/app_routes.dart';
import 'package:opportunity_app/core/extensions/widget_extension.dart';
import 'package:opportunity_app/data/model/apply_model.dart';

import '../../controller/apply_controller.dart';
import '../../controller/job_controller.dart';
import '../../link_api.dart';

class UserRequestPage extends StatelessWidget {
  const UserRequestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Request Page'),
      ),
      body: GetBuilder<ApplyControllerImp>(
        builder: (controller) => ViewHandle(
          onPressed: () => controller.getAllData(),
          statusRequest: controller.statusRequest,
          widget: ListView.builder(
            itemCount: controller.length,
            itemBuilder: (context, index) {
              ApplyModel item = controller.applies[index];
              return Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      // leading: Image.asset(AppImages.request),
                      title: Text(item.companyName),
                      subtitle: Text(
                        'job: ${item.jobTitle}',
                      ),
                      leading: CircleAvatar(
                        radius: 32,
                        backgroundColor: Colors.blue,
                        backgroundImage: item.companyImageUrl != null
                            ? NetworkImage(
                                '${AppLink.images}/image/${item.companyImageUrl!}',
                              )
                            : null,
                        child: item.companyImageUrl == null
                            ? Text(
                                item.companyName == ''
                                    ? ' '
                                    : item.companyName[0],
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              )
                            : null,
                      ),
                      trailing: Text(
                        item.status,
                        style: TextStyle(
                          color: controller.getColor(item.status),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ).paddingSymmetric(vertical: 16),
              ).onTap(
                () {
                  Get.find<JobControllerImp>().getDataById(item.jobId);
                  Get.toNamed(AppRoutes.jobDetailsPage);
                },
              ).paddingSymmetric(horizontal: 16, vertical: 4);
            },
          ),
        ),
      ),
    );
  }
}
