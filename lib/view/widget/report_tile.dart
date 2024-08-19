import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:opportunity_app/core/extensions/widget_extension.dart';
import 'package:opportunity_app/link_api.dart';
import 'package:opportunity_app/view/screen/view_util/image_page.dart';

class ReportTile extends StatelessWidget {
  const ReportTile({
    super.key,
    required this.cause,
    required this.details,
    required this.username,
    required this.imageUrl,
  });
  final String cause;
  final String details;
  final String? imageUrl;
  final String username;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 4.0,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ListTile(
        title: Text('cause: $cause'),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8.0),
            Text('details: $details'),
            const SizedBox(height: 8.0),
            Text('User: $username'),
            if (imageUrl != null) const SizedBox(height: 8.0),
            if (imageUrl != null)
              Container(
                height: 300,
                width: 400,
                decoration: const BoxDecoration(color: Colors.grey),
                child: Image.network(
                  "${AppLink.images}/image/${imageUrl!}",
                  fit: BoxFit.cover,
                ),
              ).onTap(() {
                Get.to(() => ImagePage(image: imageUrl!));
              })
          ],
        ),
      ),
    );
  }
}
