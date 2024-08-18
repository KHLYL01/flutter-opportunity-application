import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:opportunity_app/controller/apply_controller.dart';
import 'package:opportunity_app/controller/company_profile_controller.dart';
import 'package:opportunity_app/controller/job_controller.dart';
import 'package:opportunity_app/core/constants/app_keys.dart';
import 'package:opportunity_app/core/constants/app_routes.dart';
import 'package:opportunity_app/data/model/job_model.dart';
import 'package:opportunity_app/link_api.dart';
import 'package:opportunity_app/view/widget/fill_button.dart';

class JopDetailsPage extends GetView<ApplyControllerImp> {
  const JopDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    JobModel jobModel = Get.arguments[0];
    String? isFound = controller.checkIsFound(jobModel.id);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Job Title'),
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
      body: ListView(
        children: [
          ListTile(
            onTap: () {
              Get.toNamed(AppRoutes.viewCompanyProfilePage);
              Get.find<CompanyProfileControllerImp>()
                  .getCompanyProfile(id: jobModel.companyId);
              Get.find<JobControllerImp>()
                  .getAllDataByCompanyUserId(id: jobModel.companyId);
            },
            title: Text(
              jobModel.companyName,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              jobModel.companyScope,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            leading: jobModel.companyImageUrl == ''
                ? CircleAvatar(
                    radius: 24,
                    child: Text(
                      jobModel.companyName[0],
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
                      "${AppLink.images}/image/${jobModel.companyImageUrl}",
                    ),
                  ),
            trailing: Container(
              decoration: BoxDecoration(
                  color: Colors.grey.shade700,
                  borderRadius: BorderRadius.circular(4)),
              child: Text(
                jobModel.jobSubCategoryName,
                style: const TextStyle(fontSize: 12, color: Colors.white),
              ).paddingSymmetric(vertical: 4, horizontal: 8),
            ),
          ),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Publish date: ${jobModel.createdDate.substring(0, 10)}',
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w700),
                  ).paddingSymmetric(horizontal: 16, vertical: 4),
                  Text(
                    'Expiry date: ${jobModel.expiryDate.substring(0, 10)}',
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
                  'location: ${jobModel.location.length > 12 ? '${jobModel.location.substring(0, 12)}...' : jobModel.location}',
                  style: const TextStyle(fontSize: 16, color: Colors.white),
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
              jobModel.title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              jobModel.description,
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
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ).paddingSymmetric(horizontal: 16, vertical: 4),
          Text(
            'Job Type: ${jobModel.jopType}',
            style: const TextStyle(
              fontSize: 18,
            ),
          ).paddingSymmetric(horizontal: 16, vertical: 4),
          Text(
            'Age: ${jobModel.age == 0 ? 'any' : jobModel.age}',
            style: const TextStyle(
              fontSize: 18,
            ),
          ).paddingSymmetric(horizontal: 16, vertical: 4),
          Text(
            'Gender: ${jobModel.gender}',
            style: const TextStyle(
              fontSize: 18,
            ),
          ).paddingSymmetric(horizontal: 16, vertical: 4),
          Text(
            'Nationality: ${jobModel.nationality}',
            style: const TextStyle(
              fontSize: 18,
            ),
          ).paddingSymmetric(horizontal: 16, vertical: 4),
          Text(
            'Experience: ${jobModel.experience}',
            style: const TextStyle(
              fontSize: 18,
            ),
          ).paddingSymmetric(horizontal: 16, vertical: 4),
          Text(
            'Status: ${jobModel.online}',
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
                  text: isFound ?? 'Apply Now',
                  textFont: 20,
                  onPressed: isFound != null
                      ? null
                      : () {
                          controller.postDate(jobModel.id);
                        },
                ).paddingOnly(right: 16),
              ],
            ).paddingOnly(top: 10)
        ],
      ),
    );
  }
}
