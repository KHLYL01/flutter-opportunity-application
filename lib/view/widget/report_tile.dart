import 'package:flutter/material.dart';
import 'package:opportunity_app/core/constants/app_images.dart';
import '../../data/data_sources/static/report_model.dart';

class ReportTile extends StatelessWidget {
  const ReportTile({
    super.key,
    required this.report,
  });
  final Report report;

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
        title: Text(report.cause),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8.0),
            Text(report.details),
            const SizedBox(height: 8.0),
            Text('Company: ${report.companyName}'),
            const SizedBox(height: 8.0),
            Text('User: ${report.userName}'),
            Container(
              height: 300,
              width: 400,
              decoration: const BoxDecoration(color: Colors.grey),
              child: Image.asset(
                AppImages.onBoarding1,
                fit: BoxFit.fill,
              ),
            )
          ],
        ),
      ),
    );
  }
}
