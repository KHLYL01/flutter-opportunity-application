import 'package:flutter/material.dart';
import 'package:opportunity_app/core/constants/app_images.dart';
import 'package:opportunity_app/view/widget/fill_button.dart';

import '../../core/constants/app_colors.dart';

class CompanyCardWidget extends StatelessWidget {
  final String companyName;
  final String accountNumber;

  final VoidCallback? onAccept;
  final VoidCallback? onDecline;

  const CompanyCardWidget({
    Key? key,
    required this.companyName,
    required this.accountNumber,
    required this.onAccept,
    required this.onDecline,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              leading: Image.asset(AppImages.request),
              title: Text('company: $companyName'),
              subtitle: Text('Account: $accountNumber'),
            ),
            const SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomFillButton(
                  fillColor: AppColors.heavyRed,
                  width: 200,
                  text: 'Decline And Delete',
                  onPressed: onDecline,
                ),
                CustomFillButton(
                  fillColor: AppColors.myDarkBlue,
                  width: 100,
                  text: 'Accept',
                  onPressed: onAccept,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
