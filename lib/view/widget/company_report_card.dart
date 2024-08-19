import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../link_api.dart';

class CompanyReportCard extends StatelessWidget {
  const CompanyReportCard({
    super.key,
    required this.companyName,
    required this.companyScope,
    required this.companyImageUrl,
    required this.reportCount,
  });

  final String companyName;
  final String? companyScope;
  final String? companyImageUrl;
  final int reportCount;

  @override
  Widget build(BuildContext context) {
    return Container(
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
        title: Text(companyName),
        subtitle: Text(companyScope ?? '...'),
        leading: CircleAvatar(
          radius: 32,
          backgroundColor: Colors.blue,
          backgroundImage: companyImageUrl != null
              ? NetworkImage(
                  '${AppLink.images}/image/${companyImageUrl!}',
                )
              : null,
          child: companyImageUrl == null
              ? Text(
                  companyName == '' ? ' ' : companyName[0],
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                )
              : null,
        ),
        trailing: Text(
          '$reportCount reports',
          style: const TextStyle(fontSize: 14),
        ),
      ),
    ).paddingSymmetric(vertical: 8, horizontal: 16);
  }
}
