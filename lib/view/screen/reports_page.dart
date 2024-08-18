import 'package:flutter/material.dart';

import '../../../data/data_sources/static/reoprt_data.dart';
import '../widget/report_tile.dart';

class ReportPage extends StatelessWidget {
  const ReportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: reports.length,
        itemBuilder: (context, index) {
          return ReportTile(report: reports[index]);
        },
      ),
    );
  }
}
