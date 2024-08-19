import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:opportunity_app/controller/apply_controller.dart';
import 'package:opportunity_app/controller/company_profile_controller.dart';
import 'package:opportunity_app/controller/job_controller.dart';
import 'package:opportunity_app/core/class/view_handle.dart';
import 'package:opportunity_app/core/constants/app_keys.dart';
import 'package:opportunity_app/core/constants/app_routes.dart';
import 'package:opportunity_app/link_api.dart';
import 'package:opportunity_app/view/widget/fill_button.dart';

import '../../controller/rate_controller.dart';

class JopDetailsPage extends StatelessWidget {
  const JopDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    // JobModel jobModel = Get.arguments[0];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Job Details'),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            size: 25,
            color: Colors.black,
          ),
        ),
      ),
      body: GetBuilder<JobControllerImp>(
          builder: (controller) => ViewHandle(
                statusRequest: controller.statusRequest,
                widget: ListView(
                  children: [
                    ListTile(
                      onTap: () {
                        Get.find<RateControllerImp>()
                            .getAllDataByCompanyProfileId();

                        Get.toNamed(AppRoutes.viewCompanyProfilePage);
                        Get.find<CompanyProfileControllerImp>()
                            .getCompanyProfile(
                                id: controller.jobModel.companyId);
                        Get.find<JobControllerImp>().getAllDataByCompanyUserId(
                            id: controller.jobModel.companyId);
                      },
                      title: Text(
                        controller.jobModel.companyName,
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        controller.jobModel.companyScope == null
                            ? '...'
                            : controller.jobModel.companyScope!,
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                      leading: controller.jobModel.companyImageUrl == null
                          ? CircleAvatar(
                              radius: 24,
                              child: Text(
                                controller.jobModel.companyName[0],
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                            )
                          : CircleAvatar(
                              radius: 24,
                              backgroundImage: NetworkImage(
                                "${AppLink.images}/image/${controller.jobModel.companyImageUrl}",
                              ),
                            ),
                      trailing: Container(
                        decoration: BoxDecoration(
                            color: Colors.grey.shade700,
                            borderRadius: BorderRadius.circular(4)),
                        child: Text(
                          controller.jobModel.jobSubCategoryName,
                          style: const TextStyle(
                              fontSize: 12, color: Colors.white),
                        ).paddingSymmetric(vertical: 4, horizontal: 8),
                      ),
                    ),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Publish date: ${controller.jobModel.createdDate.substring(0, 10)}',
                              style: const TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w700),
                            ).paddingSymmetric(horizontal: 16, vertical: 4),
                            Text(
                              'Expiry date: ${controller.jobModel.expiryDate.substring(0, 10)}',
                              style: const TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w700),
                            ).paddingSymmetric(horizontal: 16, vertical: 4),
                          ],
                        ),
                        const Spacer(),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.grey.shade700,
                              borderRadius: BorderRadius.circular(4)),
                          child: Text(
                            'location: ${controller.jobModel.location.length > 12 ? '${controller.jobModel.location.substring(0, 12)}...' : controller.jobModel.location}',
                            style: const TextStyle(
                                fontSize: 16, color: Colors.white),
                          ).paddingSymmetric(vertical: 4, horizontal: 12),
                        ).paddingOnly(right: 24),
                      ],
                    ),
                    const Divider(
                      color: Colors.black,
                      thickness: 1,
                    ).paddingSymmetric(horizontal: 10),
                    ListTile(
                      title: Text(
                        controller.jobModel.title,
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        controller.jobModel.description,
                        style: const TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ),
                    const Divider(
                      color: Colors.black,
                      thickness: 1,
                    ).paddingSymmetric(horizontal: 10),
                    const Text(
                      'Job Requirement',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ).paddingSymmetric(horizontal: 16, vertical: 4),
                    Text(
                      'Job Type: ${controller.jobModel.jopType}',
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    ).paddingSymmetric(horizontal: 16, vertical: 4),
                    Text(
                      'Age: ${controller.jobModel.age == 0 ? 'any' : controller.jobModel.age}',
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    ).paddingSymmetric(horizontal: 16, vertical: 4),
                    Text(
                      'Gender: ${controller.jobModel.gender}',
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    ).paddingSymmetric(horizontal: 16, vertical: 4),
                    Text(
                      'Nationality: ${controller.jobModel.nationality}',
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    ).paddingSymmetric(horizontal: 16, vertical: 4),
                    Text(
                      'Experience: ${controller.jobModel.experience}',
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    ).paddingSymmetric(horizontal: 16, vertical: 4),
                    Text(
                      'Status: ${controller.jobModel.online}',
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    ).paddingSymmetric(horizontal: 16, vertical: 4),
                    if (controller.myServices.getString(AppKeys.role) == 'USER')
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          CustomFillButton(
                            width: context.width * .4,
                            text: Get.find<ApplyControllerImp>()
                                    .checkIsFound(controller.jobModel.id) ??
                                'Apply Now',
                            textFont: 20,
                            onPressed: Get.find<ApplyControllerImp>()
                                        .checkIsFound(controller.jobModel.id) !=
                                    null
                                ? null
                                : () {
                                    Get.find<ApplyControllerImp>()
                                        .postDate(controller.jobModel.id);
                                  },
                          ).paddingOnly(right: 16),
                        ],
                      ).paddingOnly(top: 10)
                  ],
                ),
              )),
    );
  }
}
