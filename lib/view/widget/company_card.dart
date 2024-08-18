import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:opportunity_app/core/constants/app_images.dart';
import 'package:opportunity_app/link_api.dart';

import '../../core/constants/app_colors.dart';

class CompanyCard extends StatelessWidget {
  const CompanyCard({
    Key? key,
    required this.name,
    required this.scope,
    required this.imageUrl,
    required this.review,
    required this.totalRate,
  }) : super(key: key);

  final String name;
  final String scope;
  final String imageUrl;
  final int review;
  final double totalRate;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width * 0.4,
      decoration: BoxDecoration(
        color: AppColors.verLightBlue,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.black54),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            dense: true,
            title: Text(
              name,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            contentPadding: EdgeInsets.zero,
            minVerticalPadding: 0,
            minLeadingWidth: 0,
            leading: imageUrl == ''
                ? const CircleAvatar(
                    radius: 24,
                    backgroundImage: AssetImage(AppImages.splash),
                  )
                : CircleAvatar(
                    radius: 24,
                    backgroundImage:
                        NetworkImage('${AppLink.images}/image/$imageUrl'),
                  ),
          ),
          Text(
            scope,
            style: const TextStyle(fontSize: 15),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          IntrinsicHeight(
            child: Row(
              children: [
                const Icon(
                  Icons.star,
                  color: AppColors.myDarkBlue,
                ).paddingOnly(right: 3),
                Text(
                  totalRate.toString(),
                  style: const TextStyle(fontSize: 14),
                ),
                const VerticalDivider(
                  color: Colors.black54,
                  width: 20,
                  indent: 5,
                  endIndent: 5,
                  thickness: 1.2,
                ),
                Text(
                  '$review Reviews',
                  style: const TextStyle(
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          )
        ],
      ).paddingAll(8),
    );
  }
}
