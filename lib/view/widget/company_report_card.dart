import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:opportunity_app/core/extensions/widget_extension.dart';

import '../../data/data_sources/static/company_reported_model.dart';

class CompanyReportCard extends StatelessWidget {
  const CompanyReportCard({
    super.key,
    required this.company,
  });

  final CompanyReportedModel company;

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
        title: Text(company.name),
        trailing: Text('${company.reportCount} reports'),
      ),
    ).marginSymmetric(vertical: 8, horizontal: 16).onTap(() {
      Get.toNamed('/report_page');
    });
  }
}
