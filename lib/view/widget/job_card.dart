import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constants/app_colors.dart';

class JobCard extends StatelessWidget {
  const JobCard({
    Key? key,
    required this.name,
    required this.description,
    required this.location,
    required this.expiryDate,
    required this.jobType,
    required this.online,
  }) : super(key: key);

  final String name;
  final String description;
  final String location;
  final String expiryDate;
  final String jobType;
  final String online;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.height / 5,
      width: context.width * 0.4,
      decoration: BoxDecoration(
        color: AppColors.verLightBlue,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.black54),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            description,
            style: const TextStyle(fontSize: 15),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const Spacer(),
          const Divider(color: Colors.black54),
          Text('location: $location'),
          Text('expiry date: $expiryDate'),
          const Spacer(),
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Colors.grey.shade700,
                    borderRadius: BorderRadius.circular(4)),
                child: Text(
                  online, //'at work
                  style: const TextStyle(fontSize: 12, color: Colors.white),
                ).paddingSymmetric(vertical: 4, horizontal: 8),
              ).paddingOnly(right: 4),
              Container(
                decoration: BoxDecoration(
                    color: Colors.grey.shade700,
                    borderRadius: BorderRadius.circular(4)),
                child: Text(
                  jobType, //'at work
                  style: const TextStyle(fontSize: 12, color: Colors.white),
                ).paddingSymmetric(vertical: 4, horizontal: 8),
              ),
            ],
          ),
        ],
      ).paddingAll(8),
    );
  }
}
