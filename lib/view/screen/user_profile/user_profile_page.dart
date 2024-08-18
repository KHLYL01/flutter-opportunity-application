import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:opportunity_app/controller/user_profile_controller.dart';
import 'package:opportunity_app/core/class/view_handle.dart';
import 'package:opportunity_app/core/enums/status_request.dart';
import 'package:opportunity_app/core/extensions/widget_extension.dart';
import 'package:opportunity_app/link_api.dart';
import 'package:opportunity_app/view/widget/outline_button.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../controller/free_job_controller.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_routes.dart';
import '../view_util/image_page.dart';

class UserProfilePage extends StatelessWidget {
  const UserProfilePage({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserProfileControllerImp>(
      builder: (controller) => ViewHandle(
        onPressed: () => controller.getUserProfile(),
        statusRequest: controller.statusRequest,
        widget: Scaffold(
          appBar: AppBar(
            title: Text("${controller.userProfile.name} Profile"),
            centerTitle: true,
            actions: [
              IconButton(
                onPressed: () => controller.toUpdateProfile(),
                icon: const Icon(
                  Icons.edit,
                  size: 24,
                ),
              ).paddingOnly(right: 5)
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () => Get.toNamed(
              AppRoutes.addFreeJobPage,
            ),
            child: const Icon(Icons.add),
          ),
          body: ListView(
            children: [
              ListTile(
                leading: CircleAvatar(
                  radius: 32,
                  backgroundColor: Colors.blue,
                  backgroundImage: controller.userProfile.imageUrl != null
                      ? NetworkImage(
                          '${AppLink.images}/image/${controller.userProfile.imageUrl!}',
                        )
                      : null,
                  child: controller.userProfile.imageUrl == null
                      ? Text(
                          controller.userProfile.name == ''
                              ? ' '
                              : controller.userProfile.name[0],
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        )
                      : null,
                ).onTap(
                  controller.userProfile.imageUrl != null
                      ? () {
                          Get.to(
                            () => ImagePage(
                              image: controller.userProfile.imageUrl!,
                            ),
                          );
                        }
                      : () {},
                ),
                title: Text(
                  controller.userProfile.name,
                  style: const TextStyle(
                      fontSize: 22,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  controller.userProfile.specialty == null
                      ? 'my specialization ...'
                      : controller.userProfile.specialty!,
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
              ),
              CustomOutlineButton(
                width: context.width,
                text: 'Resume',
                icon: Icons.attach_file_outlined,
                padding: 0,
                onPressed: () {
                  Get.toNamed(AppRoutes.pdfFilePage);
                },
              ).paddingSymmetric(horizontal: 10, vertical: 10),
              const Text(
                'Main Information',
                style: TextStyle(fontSize: 22, color: Colors.black),
              ).paddingSymmetric(horizontal: 10),
              Container(
                decoration: BoxDecoration(
                  color: AppColors.verLightBlue,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.black54),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Age: ${controller.userProfile.age == 0 ? '...' : controller.userProfile.age!}',
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    ).paddingSymmetric(horizontal: 10, vertical: 8),
                    Text(
                      'Gender:  ${controller.userProfile.gender == null ? '...' : controller.userProfile.gender!}',
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    ).paddingSymmetric(horizontal: 10, vertical: 4),
                    Text(
                      'Nationality:  ${controller.userProfile.nationality == null ? '...' : controller.userProfile.nationality!}',
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    ).paddingSymmetric(horizontal: 10, vertical: 8),
                    Text(
                      'Location:  ${controller.userProfile.location == null ? '...' : controller.userProfile.location!}',
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    ).paddingSymmetric(horizontal: 10, vertical: 8),
                    Text(
                      'Educational Level:  ${controller.userProfile.educationalLevel == null ? '...' : controller.userProfile.educationalLevel!}',
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    ).paddingSymmetric(horizontal: 10, vertical: 8),
                  ],
                ),
              ).paddingSymmetric(horizontal: 10, vertical: 10),
              const Text(
                'Published Opportunities',
                style: TextStyle(fontSize: 22, color: Colors.black),
              ).paddingSymmetric(horizontal: 10),
              GetBuilder<FreeJobControllerImp>(
                builder: (controller) => controller.length == 0 &&
                        controller.statusRequest != StatusRequest.loading
                    ? SizedBox(
                        height: context.height / 2.4,
                        child: const Text('not found any free opportunity')
                            .center(),
                      )
                    : ListView.separated(
                        shrinkWrap: true,
                        physics: const ClampingScrollPhysics(),
                        itemCount: controller.length,
                        itemBuilder: (context, index) {
                          var item = controller.freeJobs[index];
                          return Container(
                            decoration: BoxDecoration(
                              color: AppColors.verLightBlue,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.black54),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item.title,
                                  style: const TextStyle(
                                    fontSize: 18,
                                  ),
                                ).paddingSymmetric(horizontal: 10, vertical: 8),
                                Text(
                                  item.description,
                                  style: const TextStyle(
                                    fontSize: 16,
                                  ),
                                ).paddingSymmetric(horizontal: 10),
                                Text(
                                  'Category: ${item.freeCategory.name}',
                                  style: const TextStyle(
                                    fontSize: 16,
                                  ),
                                ).paddingOnly(left: 10, right: 10, top: 20),
                                TextButton(
                                  onPressed: () async {
                                    var url = Uri.parse(item.url);
                                    await launchUrl(
                                      url,
                                    );
                                  },
                                  child: const Text('Click Here'),
                                )
                              ],
                            ),
                          ).onLongPress(
                            () => controller.deleteDate(item.id),
                          );
                        },
                        separatorBuilder: (context, index) =>
                            const SizedBox(height: 10),
                      ).paddingSymmetric(horizontal: 10, vertical: 10),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
