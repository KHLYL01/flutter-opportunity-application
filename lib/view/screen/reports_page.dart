import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:opportunity_app/core/enums/status_request.dart';
import 'package:opportunity_app/core/extensions/widget_extension.dart';
import 'package:opportunity_app/data/model/report_model.dart';

import '../../controller/report_controller.dart';
import '../widget/report_tile.dart';

class ReportPage extends StatelessWidget {
  const ReportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reports'),
        centerTitle: true,
      ),
      body: GetBuilder<ReportControllerImp>(
        builder: (controller) => controller.length == 0 &&
                controller.statusRequest != StatusRequest.loading
            ? const Text('Not Found Report!').center()
            : ListView.builder(
                itemCount: controller.length,
                itemBuilder: (context, index) {
                  ReportModel item = controller.reports[index];
                  return ReportTile(
                    cause: item.cause,
                    details: item.details,
                    username: item.userProfileName,
                    imageUrl: item.imageUrl,
                  );
                },
              ),
      ),
    );
  }
}
