import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:opportunity_app/link_api.dart';

import '../../core/constants/app_colors.dart';

class PeopleCard extends StatelessWidget {
  const PeopleCard({
    Key? key,
    required this.name,
    required this.description,
    required this.imageUrl,
  }) : super(key: key);

  final String name;
  final String description;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width * 0.4,
      decoration: BoxDecoration(
        color: AppColors.verLightBlue,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.black54),
      ),
      child: ListTile(
        dense: true,
        title: Text(
          name,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Text(
          description,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        contentPadding: EdgeInsets.zero,
        minVerticalPadding: 0,
        minLeadingWidth: 0,
        leading: imageUrl == ''
            ? CircleAvatar(
                radius: 24,
                child: Text(
                  name[0],
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              )
            : CircleAvatar(
                radius: 24,
                backgroundImage:
                    NetworkImage("${AppLink.images}/image/$imageUrl"),
              ),
        trailing: const Icon(Icons.arrow_forward_ios).paddingOnly(right: 5),
      ).paddingAll(8),
    );
  }
}
