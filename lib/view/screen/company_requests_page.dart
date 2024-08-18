import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:opportunity_app/controller/user_profile_controller.dart';
import 'package:opportunity_app/core/class/view_handle.dart';
import 'package:opportunity_app/core/constants/app_routes.dart';
import 'package:opportunity_app/core/extensions/widget_extension.dart';
import 'package:opportunity_app/data/model/apply_model.dart';

import '../../controller/apply_controller.dart';
import '../../controller/free_job_controller.dart';
import '../../core/constants/app_colors.dart';
import '../../link_api.dart';
import '../widget/fill_button.dart';

class CompanyRequestPage extends StatelessWidget {
  const CompanyRequestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Apply Job Page'),
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
                      title: Text(item.userProfileName),
                      subtitle: Text(
                        'job: ${item.jobTitle}',
                      ),
                      leading: CircleAvatar(
                        radius: 32,
                        backgroundColor: Colors.blue,
                        backgroundImage: item.userProfileImageUrl != null
                            ? NetworkImage(
                                '${AppLink.images}/image/${item.userProfileImageUrl!}',
                              )
                            : null,
                        child: item.userProfileImageUrl == null
                            ? Text(
                                item.userProfileName == ''
                                    ? ' '
                                    : item.userProfileName[0],
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
                    Column(
                      children: [
                        CustomFillButton(
                          fillColor: AppColors.myDarkBlue,
                          width: double.infinity,
                          text: 'View Profile',
                          onPressed: () {
                            Get.toNamed(AppRoutes.viewUserProfilePage);
                            Get.find<UserProfileControllerImp>()
                                .getUserProfile(id: item.userProfileId);
                            Get.find<FreeJobControllerImp>()
                                .getAllDataByUserProfileId(
                                    id: item.userProfileId);
                          },
                        ),
                        if (item.status == "REQUESTING")
                          const SizedBox(height: 8),
                        if (item.status == "REQUESTING")
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              CustomFillButton(
                                fillColor: AppColors.myDarkBlue,
                                width: double.infinity,
                                text: 'Accept',
                                onPressed: () {
                                  controller.updateDate(
                                    item.id,
                                    'ACCEPTABLE',
                                  );
                                },
                              ).expanded(flex: 1),
                              const SizedBox(width: 8),
                              CustomFillButton(
                                fillColor: AppColors.heavyRed,
                                width: double.infinity,
                                text: 'Decline',
                                onPressed: () {
                                  controller.updateDate(
                                    item.id,
                                    'UNACCEPTABLE',
                                  );
                                },
                              ).expanded(flex: 1)
                            ],
                          ),
                      ],
                    ).paddingSymmetric(horizontal: 16, vertical: 8),
                  ],
                ).paddingSymmetric(vertical: 16),
              ).paddingSymmetric(horizontal: 16, vertical: 4);
            },
          ),
        ),
      ),
    );
  }
}
