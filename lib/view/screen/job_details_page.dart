import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:opportunity_app/view/widget/fill_button.dart';

import '../../core/constants/app_images.dart';

class JopDetailsPage extends StatelessWidget {
  const JopDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
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
            title: const Text(
              'Company Name',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            subtitle: const Text(
              'Company Scope',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            leading: '' == ''
                ? const CircleAvatar(
                    radius: 24,
                    backgroundImage: AssetImage(AppImages.splash),
                  )
                : const CircleAvatar(
                    radius: 24,
                    backgroundImage: NetworkImage('imageUrl'),
                  ),
            trailing: Container(
              decoration: BoxDecoration(
                  color: Colors.grey.shade700,
                  borderRadius: BorderRadius.circular(4)),
              child: const Text(
                'job category',
                style: TextStyle(fontSize: 12, color: Colors.white),
              ).paddingSymmetric(vertical: 4, horizontal: 8),
            ),
          ),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Publish date: 15/10/2025',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
                  ).paddingSymmetric(horizontal: 16, vertical: 4),
                  const Text(
                    'Expiry date: 15/10/2025',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
                  ).paddingSymmetric(horizontal: 16, vertical: 4),
                ],
              ),
              const Spacer(),
              Container(
                decoration: BoxDecoration(
                    color: Colors.grey.shade700,
                    borderRadius: BorderRadius.circular(4)),
                child: const Text(
                  'location',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ).paddingSymmetric(vertical: 4, horizontal: 12),
              ).paddingOnly(right: 24),
            ],
          ),
          const Divider(
            color: Colors.black,
            thickness: 1,
          ).paddingSymmetric(horizontal: 10),
          const ListTile(
            title: Text(
              'Job Title',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              'Job Description Job DescriptionJob DescriptionJob DescriptionJob DescriptionJob DescriptionJob DescriptionJob DescriptionJob DescriptionJob DescriptionJob DescriptionJob DescriptionJob DescriptionJob DescriptionJob DescriptionJob DescriptionJob DescriptionJob DescriptionJob DescriptionJob DescriptionJob DescriptionJob DescriptionJob DescriptionJob DescriptionJob DescriptionJob DescriptionJob DescriptionJob DescriptionJob DescriptionJob DescriptionJob Description',
              style: TextStyle(
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
          const Text(
            'Job Type: Full Time',
            style: TextStyle(
              fontSize: 18,
            ),
          ).paddingSymmetric(horizontal: 16, vertical: 4),
          const Text(
            'Age: 22',
            style: TextStyle(
              fontSize: 18,
            ),
          ).paddingSymmetric(horizontal: 16, vertical: 4),
          const Text(
            'Gender: Male',
            style: TextStyle(
              fontSize: 18,
            ),
          ).paddingSymmetric(horizontal: 16, vertical: 4),
          const Text(
            'nationality: Syrian',
            style: TextStyle(
              fontSize: 18,
            ),
          ).paddingSymmetric(horizontal: 16, vertical: 4),
          const Text(
            'experience: 2+ years',
            style: TextStyle(
              fontSize: 18,
            ),
          ).paddingSymmetric(horizontal: 16, vertical: 4),
          const Text(
            'Remotely: Yes',
            style: TextStyle(
              fontSize: 18,
            ),
          ).paddingSymmetric(horizontal: 16, vertical: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CustomFillButton(
                width: context.width * .315,
                text: 'Apply Now',
                textFont: 20,
                onPressed: () {},
              ).paddingOnly(right: 16),
            ],
          ).paddingOnly(top: 10)
        ],
      ),
    );
  }
}
