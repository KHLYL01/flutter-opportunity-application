import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:opportunity_app/controller/home_controller.dart';
import 'package:opportunity_app/core/enums/status_request.dart';
import 'package:opportunity_app/core/extensions/widget_extension.dart';
import 'package:opportunity_app/data/model/report_model.dart';
import 'package:opportunity_app/data/model/user_model.dart';

import '../../controller/report_controller.dart';
import '../widget/company_request_card.dart';
import '../widget/report_tile.dart';

class AdminCompanyRequestPage extends StatelessWidget {
  const AdminCompanyRequestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Authentication Requests'),
      ),
      body: GetBuilder<HomeControllerImp>(
        builder: (controller) => controller.companyRequest.isEmpty &&
                controller.statusRequest != StatusRequest.loading
            ? const Text('Not Found Requests!').center()
            : ListView.builder(
                itemCount: controller.companyRequest.length,
                itemBuilder: (context, index) {
                  UserModel item = controller.companyRequest[index];
                  return CompanyCardWidget(
                    companyName: item.name,
                    accountNumber: item.phoneNumber,
                    onAccept: () {
                      controller.updateCompanyRequest(item.id);
                    },
                    onDecline: () {
                      controller.deleteCompanyRequest(item.id);
                    },
                  );
                },
              ),
      ),
    );
  }
}
