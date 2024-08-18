import 'package:flutter/material.dart';

import '../../data/data_sources/static/reoprt_data.dart';
import '../widget/company_report_card.dart';

class CompaniesReportedPage extends StatelessWidget {
  const CompaniesReportedPage({super.key});

  @override
  Widget build(BuildContext context) {
    companies.sort((a, b) => b.reportCount.compareTo(a.reportCount));
    return Scaffold(
        appBar: AppBar(
          title: const Text('Companies Reported'),
          centerTitle: true,
        ),
        body: ListView.builder(
          itemCount: companies.length,
          itemBuilder: (context, index) {
            return CompanyReportCard(company: companies[index]);
          },
        ));
  }
}
