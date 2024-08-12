import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:get/get.dart';
import 'package:opportunity_app/core/constants/app_colors.dart';
import 'package:opportunity_app/core/extensions/widget_extension.dart';
import 'package:opportunity_app/view/widget/fill_button.dart';

import '../../core/constants/app_images.dart';
import '../../core/constants/app_routes.dart';
import '../widget/job_card.dart';

class CompanyProfilePage extends StatelessWidget {
  const CompanyProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Company Profile'),
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
            dense: true,
            title: const Text(
              'Company Name',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            subtitle: const Text(
              'Company Scope Company Scope Company Scope Company Scope Company Scope Company Scope Company Scope Company Scope Company Scope Company Scope ',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            leading: '' == ''
                ? Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.black45),
                      image: const DecorationImage(
                        image: AssetImage(AppImages.splash),
                        fit: BoxFit.cover,
                      ),
                    ),
                  )
                : const CircleAvatar(
                    radius: 48,
                    backgroundImage: NetworkImage('imageUrl'),
                  ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CustomFillButton(
                width: context.width * 0.2,
                text: 'Report',
                fillColor: AppColors.heavyRed,
                onPressed: () {},
              ),
              const SizedBox(width: 30),
              CustomFillButton(
                width: context.width * 0.2,
                text: 'Follow',
                onPressed: () {},
              ),
            ],
          ).paddingSymmetric(horizontal: 32, vertical: 4),
          const Divider(
            color: Colors.black,
            thickness: 1,
          ).paddingSymmetric(horizontal: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Icon(
                Icons.star,
                color: AppColors.myDarkBlue,
                size: 32,
              ),
              const Text(
                '2.5',
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
              const SizedBox(
                height: 27,
                child: VerticalDivider(
                  color: Colors.black,
                ),
              ),
              const Text(
                '10',
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
              const Text(
                'Reviews',
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
              const SizedBox(
                width: 10,
              ),
              RatingStars(
                value: 2.5,
                maxValue: 5,
                maxValueVisibility: false,
                valueLabelVisibility: false,
                starColor: AppColors.myDarkBlue,
                starSize: 30,
                onValueChanged: (value) {},
                starCount: 5,
                starSpacing: 4,
                // starOffColor: Colors.white,
              ),
            ],
          ).paddingSymmetric(horizontal: 16),
          const Divider(
            color: Colors.black,
            thickness: 1,
          ).paddingSymmetric(horizontal: 10),
          const Text(
            'Published Opportunities',
            style: TextStyle(fontSize: 22, color: Colors.black),
          ).paddingOnly(left: 10),
          ListView.separated(
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            itemCount: 10,
            itemBuilder: (context, index) {
              return const JobCard(
                name:
                    'Full Stack Developer Full Stack Developer Full Stack Developer',
                description: 'loram azsd asdiw fsdfds asdfa',
                location: 'Damascus',
                expiryDate: '10/10/2025',
                jobType: 'full time',
                isOnline: true,
              ).onTap(
                () => Get.toNamed(AppRoutes.jobDetailsPage),
              );
            },
            separatorBuilder: (context, index) => const SizedBox(height: 10),
          ).paddingSymmetric(horizontal: 10, vertical: 10),
        ],
      ),
    );
  }
}
